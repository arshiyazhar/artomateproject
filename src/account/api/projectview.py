from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
import random
import string, json
from random import choice
from string import ascii_lowercase, digits, hexdigits
from rest_framework.views import APIView
from rest_framework.response import Response
from account.models import PostProject, Skills, Bidproject, Const_skills, Experiance, country, KycInfo, Categories,PostProjectImages ,\
    Currency
from account.api.serializers import PostProjectSerializer,ProjectImageSerializer


class AllProjects(APIView):

    def get(self, request):
        queryset = PostProject.objects.values('id', 'project_title', 'description', 'min', 'max',
                                              'username', 'created_at', 'route','custom_budget','country_id').order_by('created_at').reverse()
        data = {}
        data1 = {}
        if queryset.exists():

            mylist = []
            for i in queryset:
                project_skill = Skills.objects.filter(project_id=i['id']).values('skill_name')
                bid = Bidproject.objects.filter(project_id=i['id']).values('no_of_bid').count()
                countryname = country.objects.filter(id=i['country_id']).values('country_name')                
                data= {"projects":i,"location":countryname,"skills": project_skill, "bids": bid}

                

                mylist.append(data)
            total = len(mylist)
            data1['data'] = mylist
            data1['total'] = total
            return Response(data1)
        else:
            data['message'] = "Not Found"
            data['status'] = 102
            return Response(data)


class ProjectOnCategory(APIView):
    def get(self, request, category_code):

        category = category_code
        mylist = []
        data1 = {}
        category = Categories.objects.filter(category_code=category).values('id')
        data = {}
        if not category:
            data['message'] = "not found"
            data['status'] = 102
            return Response(data)
        else:

            for i in category:
                project = PostProject.objects.filter(category_id=i['id']).values('id', 'project_title', 'route',
                                                                                 'project_code', 'username',
                                                                                 'budgetType_Id', 'currency_id', 'min',
                                                                                 'max', 'custom_budget',
                                                                                 'project_deadline')
                if project.exists():
                    for j in project:
                        project_skill = Skills.objects.filter(project_id=j['id']).values('skill_name')
                        bid = Bidproject.objects.filter(project_id=j['id']).values('no_of_bid').count()
                        bids = bid
                        data = {"projects": j, "skills": project_skill, "bids": bids}

                        mylist.append(data)
                    total = len(mylist)
                    data1['data'] = mylist
                    data1['totalcount'] = total
                    return Response(data1)
                else:
                    data = {}
                    data['message'] = "not found"
                    data['status'] = 102
                    return Response(data)


class SingleJob(AllProjects):

    def get(self, request, projectroute):
        singlejob = PostProject.objects.filter(route=projectroute)
        data = {}
        mylist=[]
        data1={}
        if singlejob.exists():
            for var in singlejob:          
                skills = Skills.objects.filter(project_id=var.id).values('skill_name', 'skill_id')
                exp = Experiance.objects.filter(id=var.experience_required).values('Exp_name')
                countryname = country.objects.filter(id=var.country_id).values('country_name')
                biddeatils = Bidproject.objects.filter(project_id=var.id).values('bid_amount', 'user_id',
                                                                                 'completion_time', 'email')
                norofbid = Bidproject.objects.filter(project_id=var.id).count()
                courrencytype = Currency.objects.filter(id=var.currency_id).values('currency_type')
                
                data={'project_name':var.project_title,
                'projetc_route':var.route,
                'project_code':var.project_code,
                'descreption' : var.description,
                'username' : var.username,
                'min' : var.min,
                'max' : var.max,
                'project_deadline' : var.project_deadline,
                
                'experienced_required' : exp,
                 'country': countryname,
                
                'currency' : courrencytype,
                'skills' : skills,
                'custombudget' : var.custom_budget,
               
                'no_of_bid' : norofbid,
               'bid details' : biddeatils
                
                }                
                data1['data'] = data                
                
                data1['message'] = "success"
                data1['status'] = 101                
            return Response(data1)
        else:
            data['message'] = "Not Found"
            data['status'] = 102
            return Response(data)
            
class PostProjectImage123(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self,request):
        if request.method == 'POST':
            user = request.user
            userid = user.id
            
            data = {}

            imagefiles = request.FILES.getlist('project_image')
            projectid =request.data['project_id']
            for i in imagefiles:
                images = PostProjectImages.objects.create(project_image=i, user_id=userid,project_id=projectid)
                print(images)
                images.save()
                data['message'] = "success"
                data['status'] = 100
            
                return Response(data)
            


class Projects(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        if request.method == 'POST':
            data = {}
            size = 3
            code = 'PR' + ''.join(random.choice(string.digits + string.ascii_letters[26:]) for _ in range(size))
            string1 = request.data['project_title']
            # cat=request.data['category_id']
            # for k in cat:
            #     print(k['id'])
            # print(cat)
            user = request.user
            project = string1.replace(" ", "-")
            string2 = '-' + ''.join(choice(digits) for i in range(8))
            project_title1 = project + string2
            postproject1 = PostProject.objects.all()
            serializer = PostProjectSerializer(data=request.data)
            user_kyc = KycInfo.objects.filter(userid=user.id)
            if user_kyc.exists():
                for kyc in user_kyc:
                    if kyc.kycstatus == 1:
                        data['message'] = "You have uploaded kyc details wait for approve"
                        data['status'] = 1
                        return Response(data)
                    elif kyc.kycstatus == 2:
                        data['message'] = "Your kyc is pending"
                        data['status'] = 0
                        return Response(data)
                    elif kyc.kycstatus == 3:
                        if postproject1.exists():
                            for var in postproject1:

                                if var.project_title == string1:
                                    # print("executing this 2")
                                    project_title12 = project_title1
                                    if serializer.is_valid():
                                        pro = serializer.save()
                                        pro.userid = user.id
                                        cat = request.data['category_id']
                                        cat1 = json.dumps(cat)
                                        pro.category_id = cat1
                                        pro.project_code = code
                                        pro.username =kyc.fullname
                                        pro.route = project_title12
                                        pro.save()
                                        project_id = pro.id
                                        skillname = request.data['skills']
                                        for i in skillname:
                                            post = Skills.objects.create(skill_id=i['id'], project_id=project_id,
                                                                         skill_name=i['skill_name'])
                                            post.save()
                                        data['result'] = 'success'
                                        data['status'] = 100
                                    else:
                                        data = serializer.errors
                                        data['status'] = 102
                                    return Response(data)

                            # print("executing this 3")
                            project_title2 = project
                            # print(project_title2)
                            if serializer.is_valid():
                                pro = serializer.save()
                                pro.userid = user.id
                                cat = request.data['category_id']
                                cat1 = json.dumps(cat)

                                pro.category_id = cat1

                                pro.project_code = code
                                pro.username =kyc.fullname
                                pro.route = project_title2
                                pro.save()
                                project_id = pro.id
                                skillname = request.data['skills']
                                for i in skillname:
                                    post = Skills.objects.create(skill_id=i['id'], project_id=project_id,
                                                                 skill_name=i['skill_name'])
                                    post.save()
                                data['result'] = 'success'
                                data['status'] = 100
                            else:
                                data = serializer.errors
                                data['status'] = 102
                            return Response(data)

                        else:

                            project_title2 = project
                            if serializer.is_valid():
                                pro = serializer.save()
                                pro.userid = user.id
                                cat = request.data['category_id']
                                cat1 = json.dumps(cat)

                                pro.category_id = cat1

                                pro.project_code = code
                                pro.username =kyc.fullname
                                pro.route = project_title2
                                pro.save()

                                project_id = pro.id
                                skillname = request.data['skills']
                                # print(skillname)
                                for i in skillname:
                                    post = Skills.objects.create(skill_id=i['id'], project_id=project_id,
                                                                 skill_name=i['skill_name'])
                                    post.save()
                                data['result'] = 'success'
                                data['status'] = 100
                            else:
                                data = serializer.errors
                                data['status'] = 102
                        return Response(data)
                    else:
                        if kyc.kycstatus == 4:
                            data['message'] = "Your kyc have been rejected"
                            data['status'] = 0
                            return Response(data)
            else:
                data['message'] = "kyc details not entered"
                data['status'] = 0
                return Response(data)





