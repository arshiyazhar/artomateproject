from django.contrib.auth.hashers import make_password
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from account.models import Userprofile, user_languages, User_Skills, Account, country, const_languages, KycInfo,PortfolioImages
from account.api.serializers import UserProfileSerializer, UserPortfolioProfile, User_portfolioSerializer


class adduserprofile(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):

        if request.method == 'POST':
            print(123)
            user = request.user
            user_id = user.id
            print(user)
            data = {}
            userprofileid = Userprofile.objects.all()
            if userprofileid.exists():
                for i in userprofileid:
                    print(userprofileid)
                    if i.user_id == user_id:
                        data['message'] = "already added your profile details"
                        data['status'] = 102
                        return Response(data)

                    else:
                        language = request.data['language_spoken']
                        skill_name = request.data['userskills']
                        serializer = UserProfileSerializer(data=request.data)

                        if serializer.is_valid():
                            userprofile = serializer.save()
                            userprofile.user_id = user_id
                            userprofile.user_name = user.username
                            for j in language:
                                lang = user_languages.objects.create(user_id=user_id, language_name=j['name'],
                                                                     language_id=j['id'])
                                lang.save()
                            for i in skill_name:
                                post = User_Skills.objects.create(user_id=user_id, skill_name=i['skill_name'],
                                                                  skill_id=i['skill_id'])
                                post.save()

                            userprofile.save()
                            data['result'] = 'success'
                            data['status'] = 101
                            return Response(data)
                        else:
                            data['status'] = 0
                            data = serializer.errors
                            return Response(data)
            else:
                language = request.data['language_spoken']
                skill_name = request.data['userskills']
                serializer = UserProfileSerializer(data=request.data)
                if serializer.is_valid():
                    userprofile = serializer.save()
                    userprofile.user_id = user_id
                    userprofile.user_name = user.username
                    for j in language:
                        lang = user_languages.objects.create(user_id=user_id, language_name=j['name'],
                                                             language_id=j['id'])
                        lang.save()
                    for i in skill_name:
                        post = User_Skills.objects.create(user_id=user_id, skill_name=i['skill_name'],
                                                          skill_id=i['skill_id'])
                        post.save()

                    userprofile.save()
                    data['result'] = 'success'
                    data['status'] = 101
                    return Response(data)
                else:
                    data['status'] = 0
                    data = serializer.errors
                    return Response(data)


class updateuserprofile(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        if request.method == 'POST':
            user = request.user
            user_id = user.id
            data = {}
            kyc=KycInfo.objects.filter(userid=user_id)
            if kyc.exists():

                if 'user_name' in request.data:
                    name = request.data['user_name']
                    name1 =name.replace(" ","")
                    print(name1)
                    if not name:
                        data['message'] = "enter user name"
                        data['status'] = 102
                        return Response(data)
                    else:
                        print("test1")
                        usernameval = Account.objects.filter(username=name1).values('id')
                        print(usernameval)
                        if usernameval.exists():
                            for i in usernameval:
                                print("test2")
                                if i['id'] == user_id:
                                    print("test3")
                                    print("same")
                                    userupdate = Userprofile.objects.filter(user_id=user_id)

                                    if userupdate.exists():
                                        print("test4")

                                        userprofile12 = Account.objects.get(id=user_id)
                                        userprofile12.username=name1

                                        userkyc = KycInfo.objects.get(userid=user_id)
                                        userkyc.username = name1
                                        userkyc.save()
                                        userprofile11 = Userprofile.objects.get(user_id=user_id)
                                        userprofile11.user_name = name1
                                        userprofile12.username = name1
                                        userprofile11.about_me = request.data['about_me']
                                        userprofile11.hourely_rate = request.data['hourely_rate']
                                        userprofile11.designation = request.data['designation']
                                         
                                        userprofile11.company_name = request.data['company_name']
                                        userprofile11.phone = request.data['phone']
                                        userprofile11.country_id = request.data['country_id']
                                        userprofile11.save()
                                        userprofile12.save()

                                        language = request.data['language_spoken']
                                        skill_name = request.data['userskills']
                                        data = {}
                                        userlang = user_languages.objects.filter(user_id=user_id)
                                        userlang.delete()
                                        userskills = User_Skills.objects.filter(user_id=user_id)
                                        userskills.delete()
                                        for j in language:
                                            lang = user_languages.objects.create(user_id=user_id,
                                                                                 language_name=j['language_name'],
                                                                                 language_id=j['id'])
                                            lang.save()
                                        for i in skill_name:
                                            post = User_Skills.objects.create(user_id=user_id, skill_name=i['skill_name'],
                                                                              skill_id=i['id'])
                                            post.save()
                                        data['message'] = "success"
                                        data['status'] = 100
                                        return Response(data)
                                    else:
                                        print("test5")

                                        user = request.user
                                        user_id = user.id
                                        data = {}
                                        language = request.data['language_spoken']
                                        skill_name = request.data['userskills']
                                        userprofile12 = Account.objects.get(id=user_id)
                                        userprofile12.username = name1
                                        userprofile12.save()
                                        userkyc = KycInfo.objects.get(userid=user_id)
                                        userkyc.username = name1
                                        userkyc.save()
                                        serializer = UserProfileSerializer(data=request.data)

                                        if serializer.is_valid():
                                            userprofile = serializer.save()
                                            userprofile.user_id = user_id
                                            userprofile.user_name = name1
                                            for j in language:
                                                lang = user_languages.objects.create(user_id=user_id,
                                                                                     language_name=j['language_name'],
                                                                                     language_id=j['id'])
                                                lang.save()
                                            for i in skill_name:
                                                post = User_Skills.objects.create(user_id=user_id, skill_name=i['skill_name'],
                                                                                  skill_id=i['id'])
                                                post.save()

                                            userprofile.save()
                                            data['result'] = 'success'
                                            data['status'] = 101
                                            return Response(data)
                                        else:

                                            data['status'] = 0
                                            data = serializer.errors
                                            return Response(data)
                                else:
                                    print("not same")
                                    print("test6")
                                    data['message'] = "Username already exists"
                                    data['status'] = 102
                                    return Response(data)
                        else:
                            print("test7")
                            userupdate = Userprofile.objects.filter(user_id=user_id)
                            if userupdate.exists():
                                userprofile12 = Account.objects.get(id=user_id)
                                userprofile12.username = name1
                                userkyc = KycInfo.objects.get(userid=user_id)
                                userkyc.username = name1
                                userkyc.save()
                                userprofile11 = Userprofile.objects.get(user_id=user_id)
                                userprofile11.user_name = name1
                                userprofile12.username = name1
                                userprofile11.about_me = request.data['about_me']
                                userprofile11.hourely_rate = request.data['hourely_rate']
                                userprofile11.designation = request.data['designation']
                                 
                                userprofile11.company_name = request.data['company_name']
                                userprofile11.phone = request.data['phone']
                                userprofile11.country_id = request.data['country_id']
                                userprofile11.save()
                                userprofile12.save()

                                language = request.data['language_spoken']
                                skill_name = request.data['userskills']
                                data = {}
                                userlang = user_languages.objects.filter(user_id=user_id)
                                userlang.delete()
                                userskills = User_Skills.objects.filter(user_id=user_id)
                                userskills.delete()
                                for j in language:
                                    lang = user_languages.objects.create(user_id=user_id,
                                                                         language_name=j['language_name'],
                                                                         language_id=j['id'])
                                    lang.save()
                                for i in skill_name:
                                    post = User_Skills.objects.create(user_id=user_id, skill_name=i['skill_name'],
                                                                      skill_id=i['id'])
                                    post.save()
                                data['message'] = "success"
                                data['status'] = 100
                                return Response(data)
                            else:
                                print("test8")
                                user = request.user
                                user_id = user.id
                                data = {}
                                language = request.data['language_spoken']
                                skill_name = request.data['userskills']
                                userprofile12 = Account.objects.get(id=user_id)
                                userprofile12.username = name1
                                userprofile12.save()
                                userkyc = KycInfo.objects.get(userid=user_id)
                                userkyc.username = name1
                                userkyc.save()
                                serializer = UserProfileSerializer(data=request.data)

                                if serializer.is_valid():
                                    userprofile = serializer.save()
                                    userprofile.user_id = user_id
                                    userprofile.user_name = name1
                                    for j in language:
                                        lang = user_languages.objects.create(user_id=user_id,
                                                                             language_name=j['language_name'],
                                                                             language_id=j['id'])
                                        lang.save()
                                    for i in skill_name:
                                        post = User_Skills.objects.create(user_id=user_id, skill_name=i['skill_name'],
                                                                          skill_id=i['id'])
                                        post.save()

                                    userprofile.save()
                                    data['result'] = 'success'
                                    data['status'] = 101
                                    return Response(data)
                                else:
                                    print("test9")
                                    data['status'] = 0
                                    data = serializer.errors
                                    return Response(data)



                else:

                    userupdate = Userprofile.objects.filter(user_id=user_id)
                    if userupdate.exists():
                        userprofile11 = Userprofile.objects.get(user_id=user_id)
                        userprofile11.user_name = user.username
                        userprofile11.about_me = request.data['about_me']
                        userprofile11.hourely_rate = request.data['hourely_rate']
                        userprofile11.designation = request.data['designation']
                         
                        userprofile11.company_name = request.data['company_name']
                        userprofile11.phone = request.data['phone']
                        userprofile11.country_id = request.data['country_id']
                        userprofile11.save()

                        language = request.data['language_spoken']
                        skill_name = request.data['userskills']
                        data = {}
                        userlang = user_languages.objects.filter(user_id=user_id)
                        userlang.delete()
                        userskills = User_Skills.objects.filter(user_id=user_id)
                        userskills.delete()
                        for j in language:
                            lang = user_languages.objects.create(user_id=user_id, language_name=j['language_name'],
                                                                 language_id=j['id'])
                            lang.save()
                        for i in skill_name:
                            post = User_Skills.objects.create(user_id=user_id, skill_name=i['skill_name'],
                                                              skill_id=i['id'])
                            post.save()
                        data['message'] = "success"
                        data['status'] = 100
                        return Response(data)
                    else:
                        user = request.user
                        user_id = user.id
                        data = {}
                        language = request.data['language_spoken']
                        skill_name = request.data['userskills']
                        serializer = UserProfileSerializer(data=request.data)
                        if serializer.is_valid():
                            userprofile = serializer.save()
                            userprofile.user_id = user_id
                            userprofile.user_name = user.username
                            for j in language:
                                lang = user_languages.objects.create(user_id=user_id, language_name=j['language_name'],
                                                                     language_id=j['id'])
                                lang.save()
                            for i in skill_name:
                                post = User_Skills.objects.create(user_id=user_id, skill_name=i['skill_name'],
                                                                  skill_id=i['id'])
                                post.save()

                            userprofile.save()
                            data['result'] = 'success'
                            data['status'] = 101
                            return Response(data)
                        else:

                            data['status'] = 102
                            data = serializer.errors
                            return Response(data)
            else:
                data['message']="please complete kyc and proceed"
                data['status']=103
                return Response(data)
class updateprofilepic(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        user = request.user
        user_id = user.id
        data = {}
        kyc = KycInfo.objects.filter(userid=user_id)
        if kyc.exists():
            if 'profile' in request.data:
                photo = request.data['profile']
                if not photo:
                    data['error'] = "select an image"
                    data['status'] = 102
                    return Response(data)
                else:
                    print(1234567)
                    photo12 =str(photo)
                    imagetest=photo12.split('.')[-1]
                    print(imagetest)
                    imageext = ['pdf','zip','html','docs']
                    if imagetest  in   imageext:
                        data['message'] = "its not a image type"
                        data['status'] = 102
                        return Response(data)

                    else:
                        userprofilepic = Userprofile.objects.get(user_id=user_id)
                        userprofilepic.profile = photo
                        userprofilepic.save()
                        data['message'] = "success"
                        data['status'] = 100
                        return Response(data)


class addportfolio(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        if request.method == 'POST':
            user = request.user
            userid = user.id
            data = {}

            imagefiles=request.FILES.getlist('project_images')
            imagelimit =len(imagefiles)
            print(imagelimit)
            if imagelimit>5:
                data['message'] = "Cant upload more than 5 images"
                data['status'] = 102
                return Response(data)
            else:
                serializer = User_portfolioSerializer(data=request.data)
                if serializer.is_valid():
                    portfolio = serializer.save()
                    portfolio.user_id = userid
                    portfolio.save()
                    for i in imagefiles:
                        images=PortfolioImages.objects.create(image=i, userid=userid)
                        images.save()
                    data['message'] = "success"
                    data['status'] = 100
                else:
                    data['status'] = 0
                    data = serializer.errors
                return Response(data)

class getportfolio(APIView, ):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        if request.method == 'GET':
            user = request.user
            portfolio = UserPortfolioProfile.objects.filter(user_id=user.id).values('project_name',
                                                                                    'project_description',
                                                                                    'project_images')
            data = {}
            data['portfolio'] = portfolio
            profile = Userprofile.objects.filter(user_id=user.id).values('user_name', 'company_name', 'hourely_rate',
                                                                         'country_id', 'phone', 'description',
                                                                         'profile', 'designation', 'user_id',
                                                                         'about_us')
            data['profile'] = profile
            skills = User_Skills.objects.filter(user_id=user.id).values('skill_name')
            data['skills'] = skills
            data['status'] = 1
            data['message'] = "Featched all"
            return Response(data)


class ProfileVeiw(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        user = request.user
        user_id = user.id
        data = {}
        profile = Userprofile.objects.filter(user_id=user_id).values()
        for var in profile:
            countryname = country.objects.filter(id=var['country_id']).values('country_name')
            data = {
                "first_name": var['first_name'],
                "last_name": var['last_name'],
                "email": var['email'],
                "hourely_rate": var['hourely_rate'],
                "phone": var['phone'],
                "countryname": countryname,
            }

        return Response(data)


class ChangePassword(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        user=request.user
        oldpwd = user.password
        oldpasswd = request.data['oldpassword']

        class123 =Argon2PasswordHasher
        pwd1=  request.data['password']
        newpwd=make_password(request.data['password'])
        confirmpwd=request.data['confirmpwd']
        data={}
        if pwd1 != confirmpwd:
            data['message']='password : Passwords must match.'
            data['sataus']=105
        else:
            userpwd=Account.objects.filter(id=user.id).values()
            for i in userpwd:
                i['password']=newpwd
                userpwd.update(password=i['password'])
            data['message']='success'
            data['status']=100
        return Response(data)


class LanguageView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        lang = const_languages.objects.all().values()
        data = {}
        data['languages'] = lang
        data['message'] = "success"
        data['status'] = 101
        return Response(data)



