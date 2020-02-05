import uuid
from django.http import HttpResponse, JsonResponse, Http404
from rest_framework import status
from rest_framework.authentication import TokenAuthentication
from rest_framework.response import Response
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from django.core.mail import EmailMultiAlternatives
from django.utils.http import urlsafe_base64_decode
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string
from django.contrib.auth.tokens import default_token_generator
import random
import string
from django.conf import settings
from django.db.models import Max, Q, Count
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
from django.contrib.auth import authenticate
from rest_framework.authtoken.models import Token
from rest_framework.utils import json
from account.models import KycInfo, Account, Categories, PostProject, Userprofile, SubCategory, Skills, Budgets, \
    Bidproject, No_of_bids_for_project, Const_skills, Json_data, country, UserPortfolioProfile
from rest_framework.views import APIView
from django.core.mail import send_mail
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from account.token import account_activation_token
from django.contrib.auth.models import User, Group
from django.core.mail import EmailMessage
from account.api.serializers import RegistrationSerializer, LoginSerializer, KYCInfoSerializer, CategoriesSerializer, \
    BidProjectSerializer, PostProjectSerializer, UserProfileSerializer, SubCategorySerializer, Const_SkillSerializer, \
    NoOfBidProjectSerializer
from random import choice
from string import ascii_lowercase, digits, hexdigits
from django.http import HttpResponse, JsonResponse, Http404
from rest_framework import status
from rest_framework.authentication import TokenAuthentication
from rest_framework.response import Response
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from django.core.mail import EmailMultiAlternatives
from django.utils.http import urlsafe_base64_decode
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string

from django.contrib.auth.hashers import make_password

from django.contrib.auth.tokens import default_token_generator

import random, jwt
import string
from django.conf import settings
from django.db.models import Max, Q, Count

from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.authentication import authenticate
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
from django.contrib.auth import authenticate
from rest_framework.authtoken.models import Token
from rest_framework.utils import json
import jwt
from rest_framework_simplejwt.views import TokenObtainPairView

from account.api import serializers
from account.models import KycInfo, Account, Categories, PostProject, Userprofile, SubCategory, Skills, Budgets, \
    Bidproject, No_of_bids_for_project, Const_skills, Json_data, Phone_OTP, user_languages, User_Skills, \
    UserPortfolioProfile

from rest_framework.views import APIView
from django.core.mail import send_mail
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from account.token import account_activation_token
from django.contrib.auth.models import User, Group
from django.core.mail import EmailMessage

from account.api.serializers import RegistrationSerializer, LoginSerializer, \
    UserProfileSerializer, MyTokenObtainSerializer, User_portfolioSerializer

from random import choice
from string import ascii_lowercase, digits, hexdigits
from django.db.models import Max, Q, Count, Sum
from django.utils.crypto import get_random_string



@api_view(['POST', ])
def registration_view(request):
    user = request.data['username']
    size = 7

    if user == 'yes':
        size = 5
        string2 = '' + ''.join(choice(digits) for i in range(7))
        randomstring =  string2
        serializer = RegistrationSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            account = serializer.save()
            account.username = randomstring
            account.is_freelancer = 0
            account.is_active = False
            account.bid = 5
            account.save()
             # EMAIL VERIFICATION
            current_site = get_current_site(request)
            html_content = render_to_string('acc_active_email.html',
                                            {'user': account, 'domain': current_site.domain,
                                             'uid': urlsafe_base64_encode(force_bytes(account.pk)),
                                             'token': account_activation_token.make_token(account),
                                             })
            email = EmailMultiAlternatives('Confirm your Artomate Account')
            email.attach_alternative(html_content, "text/html")
            email.to = [request.data['email']]
            email.send()

            data['response'] = 'successfully registered new user and ' \
                               'Please confirm your email address to complete the registration '
            data['status'] = 100

        else:
            data = serializer.errors
        return Response(data)

    elif user == 'no':
        serializer = RegistrationSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            account = serializer.save()
            account.username = ''
            account.is_freelancer = 0
            account.is_active = False
            account.bid = 5
            account.save()
            
             # EMAIL VERIFICATION
            current_site = get_current_site(request)
            html_content = render_to_string('acc_active_email.html',
                                            {'user': account, 'domain': current_site.domain,
                                             'uid': urlsafe_base64_encode(force_bytes(account.pk)),
                                             'token': account_activation_token.make_token(account),
                                             })
            email = EmailMultiAlternatives('Confirm your Artomate Account')
            email.attach_alternative(html_content, "text/html")
            email.to = [request.data['email']]
            email.send()

            data['response'] = 'successfully registered new user and ' \
                               'Please confirm your email address to complete the registration '
            data['status'] = 100
        else:
            data = serializer.errors
        return Response(data)


def activate(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        account = Account.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, Account.DoesNotExist):
        account = None
    if account is not None and account_activation_token.check_token(account, token):
        account.is_active = True
        account.save()
        return render(request, 'login.html')
    else:
        return HttpResponse('Activation link is invalid!')


@api_view(["POST"])
@permission_classes((AllowAny,))
def login(request):
    username = request.data.get("email")
    password = request.data.get("password")
    if username is None or password is None:
        return Response({'error': 'Please provide both email and password'},
                        status=HTTP_400_BAD_REQUEST)
    user = authenticate(username=username, password=password)
    if not user:
        return Response({'error': 'Invalid Credentials'}, status=HTTP_200_OK)
    token, _ = Token.objects.get_or_create(user=user)
    postpro = KycInfo.objects.filter(userid=user.id)
    if postpro.exists():
        for kyc in postpro:
            if kyc.kycstatus == 1:
                return Response({'token': token.key, 'kyc_message': 'kyc details uploaded', 'kyc_status': 1},
                                status=HTTP_200_OK)
            elif kyc.kycstatus == 2:
                return Response({'token': token.key, 'kyc_message': 'kyc details pending', 'kyc_status': 2},
                                status=HTTP_200_OK)
            elif kyc.kycstatus == 3:
                return Response({'token': token.key, 'kyc_message': 'kyc details approved', 'kyc_status': 3},
                                status=HTTP_200_OK)
            else:
                if kyc.kycstatus == 4:
                    return Response({'token': token.key, 'kyc_message': 'kyc details rejected', 'kyc_status': 4},
                                    status=HTTP_200_OK)
    return Response({'token': token.key, 'kyc_message': 'kyc details not entered', 'kyc_status': 0},
                    status=HTTP_200_OK)


class DashboardView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        user = request.user
        name = user.username
        id = user.id
        totalbid = Bidproject.objects.filter(user_id=id).aggregate(Sum('bid_amount'))
        kyc_status = KycInfo.objects.filter(userid=user.id)
        data = {}
        data['user_name'] = name
        data['email'] = request.user.email
        for e in Account.objects.filter(id=id).values('bid'):
            data['Bids'] = e['bid']
        data['Reviews'] = 2
        data['Completed_jobs'] = 2
        data['Monthly_Earnings'] = totalbid
        if kyc_status.exists():
            for var in kyc_status:
                data['kyc_status'] = var.kycstatus
        else:
            data['kyc_status'] = 0
        return JsonResponse(data)


@api_view(["GET"])
def generate(size):
    size = 3
    code = 'PR' + ''.join(random.choice(string.digits + string.ascii_letters[26:]) for _ in range(size))
    return Response(code)


class BudgetsDetails(APIView):
    def get(self, request, budget_id, currency_id):
        if request.method == 'GET':
            # print(123)
            budgets = Budgets.objects.get(budgettype_id=budget_id, currency_id=currency_id)
            # print(budgets)
            data = {}
            data['min'] = budgets.min
            data['max'] = budgets.max
            return Response(data)

class BudgetIDDetails(APIView):
    def get(self, request, budget_id):
        if request.method == 'GET':
            # print(123)
            mylist=[]
            budgets = Budgets.objects.filter(budgettype_id=budget_id).values()
            # print(budgets)
            for i in budgets:
                data={"min":i['min'],"max":i['max']}
                mylist.append(data)

            data1 = {}
            data1['budgets'] = mylist
            data1['total'] = len(mylist)
            data1['message']="success"
            data1['status']=100
            return Response(data1)


class UsernameValidation(APIView):
    def post(self, request):
        if request.method == 'POST':
            name = request.data['username']

            usernameval = Account.objects.filter(username=name)
            if usernameval.exists():
                return Response('Username already taken', status=HTTP_404_NOT_FOUND)
            else:
                return Response('Success', status=HTTP_200_OK)


class UsernameValidate(APIView):
    def get(self, request):
        name = request.data['username']
        # print(name)
        usernameval = Account.objects.filter(username=name)
        if usernameval.exists():
            return Response('Username already taken', status=HTTP_404_NOT_FOUND)
        else:
            return Response('Success', status=HTTP_200_OK)


class TokenObtainPairPatchedView(TokenObtainPairView):
    """
    Takes a set of user credentials and returns an access and refresh JSON web
    token pair to prove the authentication of those credentials.
    """
    serializer_class = serializers.TokenObtainPairPatchedSerializer

    token_obtain_pair = TokenObtainPairView.as_view()




class MyTokenObtain(TokenObtainPairView):

        serializer_class = MyTokenObtainSerializer


class Logout(APIView):
    permission_classes = (IsAuthenticated, )

    def post(self, request):
        user =request.user
        user.jwt_secret=uuid.uuid4()
        user.save()

        return Response(status=status.HTTP_200_OK)
