from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
import random
import string
from random import choice
from string import ascii_lowercase, digits, hexdigits
from rest_framework.views import APIView
from rest_framework.response import Response
from account.models import Const_skills, Userprofile, PostProject, Bidproject, Skills, User_Skills, country, KycInfo, \
    user_languages, UserPortfolioProfile, Currency
from account.api.serializers import Const_SkillSerializer


class Skill_view(APIView):

    def get(self, request):
        skills = Const_skills.objects.all().values('id', 'skill_name', 'skill_code')
        data = {}
        data['skills'] = skills
        return Response(data)


class Const_Skill_Add(APIView):
    def post(self, request):
        if request.method == 'POST':
            size = 3
            skillcode = 'SKILL' + ''.join(
                random.choice(string.digits + string.ascii_letters[26:]) for _ in range(size))
            serializer = Const_SkillSerializer(data=request.data)
            data = {}
            if serializer.is_valid():
                skills = serializer.save()
                skills.skill_code = skillcode
                skills.save()
                data['result'] = 'Skill added successfully'
                data['status'] = 1
            else:
                data['status'] = 0
                data = serializer.errors
            return Response(data)


class ProjectOnSkill(APIView):
    def get(self, request, skill_code):

        skill = skill_code
        mylist = []
        data = {}
        data1 = {}
        value = Const_skills.objects.filter(skill_code=skill).values('id')
        if value.exists():

            for i in value:
                value1 = Skills.objects.filter(skill_id=i['id']).values('project_id')

                if value1.exists():

                    for j in value1:
                        results = PostProject.objects.filter(id=j['project_id']).values('id', 'project_title',
                                                                                        'description', 'min', 'max',
                                                                                        'username', 'created_at',
                                                                                        'route')
                        for k in results:
                            project_skill = Skills.objects.filter(project_id=k['id']).values('skill_name')
                            bid = Bidproject.objects.filter(project_id=k['id']).values('no_of_bid').count()
                            bids = bid
                            data = {"projects": k, "skills": project_skill, "bids": bids}
                            mylist.append(data)

                    data1['data'] = mylist
                    data1['totalcount'] = len(mylist)

                    return Response(data1)
                else:
                    data = {}
                    data['message'] = "Not Found"
                    data['status'] = 102
                    return Response(data)
        else:
            data = {}
            data['message'] = "Not Found"
            data['status'] = 102
            return Response(data)


class PostProjectOnSkill(APIView):
    def post(self, request):
        skill = request.data['skill_name']
        mylist = []
        data1 = {}
        value = Const_skills.objects.filter(name=skill).values('id')

        if value.exists():

            if value.exists():

                for i in value:
                    value1 = Skills.objects.filter(skill_id=i['id']).values('project_id')

                    if value1.exists():

                        for j in value1:
                            results = PostProject.objects.filter(id=j['project_id']).values('id', 'project_title',
                                                                                            'min', 'max',
                                                                                            'username', 'created_at',
                                                                                            'route')
                            for k in results:
                                project_skill = Skills.objects.filter(project_id=k['id']).values('skill_name')
                                bid = Bidproject.objects.filter(project_id=k['id']).values('no_of_bid').count()
                                bids = bid
                                data = {"projects": k, "skills": project_skill, "bids": bids}
                                mylist.append(data)

                        data1['data'] = mylist
                        data1['totalcount'] = len(mylist)

                        return Response(data1)
                    else:
                        data = {}
                        data['message'] = "Not Found"
                        data['status'] = 102
                        return Response(data)
            else:
                data = {}
                data['message'] = "Not Found"
                data['status'] = 102
                return Response(data)
        else:
            data = {}
            data['message'] = "Not Found"
            data['status'] = 102
            return Response(data)


class UserOnSkill(APIView):
    def get(self, request, skill_code):

        skill = skill_code
        mylist = []
        data = {}
        data1 = {}
        value = Const_skills.objects.filter(skill_code=skill).values('id')
        if value.exists():

            for i in value:
                value1 = User_Skills.objects.filter(skill_id=i['id']).values('user_id')
                if value1.exists():

                    for j in value1:
                        results = Userprofile.objects.filter(user_id=j['user_id']).values('user_name', 'designation',
                                                                                          'hourely_rate',
                                                                                          'profile', 'user_id',
                                                                                          'country_id')

                        userfullname = KycInfo.objects.filter(userid=j['user_id']).values('fullname')

                        for k in userfullname:

                            for i in results:
                                data = {
                                    "fullname": k['fullname'],
                                    "freelancer": i,
                                    "location": country.objects.filter(id=i['country_id']).values('country_name'),
                                    "ratings": 4,
                                    "jobscompleted": 2
                                }

                                mylist.append(data)
                    data1['data'] = mylist
                    data1['total'] = len(mylist)

                    return Response(data1)
                else:
                    data = {}
                    data['message'] = "Not Found"
                    data['status'] = 102
                    return Response(data)

        else:
            data = {}
            data['message'] = "Not Found"
            data['status'] = 102
            return Response(data)









