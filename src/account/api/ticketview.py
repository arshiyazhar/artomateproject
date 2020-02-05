from rest_framework.views import APIView
from rest_framework.response import Response
from account.models import TicketCat, RaiseTicket, Message
from account.api.serializers import RaiseTicketSerializer, MessageReplySerializer
from rest_framework.permissions import AllowAny, IsAuthenticated
from django.utils.crypto import get_random_string
from django.http import HttpResponse



class TicketTypeView(APIView):
    def get(self, request):
        tickettype = TicketCat.objects.all().values('id', 'name')
        data = {}
        data['ticketcategory'] = tickettype
        return Response(data)


class Raiseticket(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        user = request.user
        id = user.id

        serializer = RaiseTicketSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            ticket = serializer.save()
            ticket.user_id = id
            ticket.route = get_random_string(length=32)
            ticket.save()
            data['message'] = "Success"
            data['status'] = 100
        else:
            data['error'] = serializer.errors
            data['status'] = 102
        return Response(data)


class TicketView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        user = request.user
        id = user.id
        data = {}
        ticket = RaiseTicket.objects.filter(user_id=id).values()
        data['ticketlist'] = ticket
        data['total'] = len(ticket)
        data['message'] = 'success'
        data['status'] = 100
        return Response(data)


class ViewAll(APIView):
     permission_classes = (IsAuthenticated,)
     def get(self, request,route_id):
         user = request.user
         id = user.id

         data = {}
         ticket = RaiseTicket.objects.filter(route=route_id).filter(user_id=id).values()

         if ticket.exists():
             ticketview = Message.objects.filter(ticket_route=route_id).values()
             data['ticket'] = ticket
             data['ticketview'] = ticketview
             data['message'] = "success"
             data['status'] = 100
             return Response(data)
         else:
             data['message'] = "not  found"
             data['status'] = 102
             return Response(data)
             
             
class MessageView(APIView):
    permission_classes = (IsAuthenticated,)
    def post(self, request):
        user = request.user
        id = user.id
        data = {}
        ticket_route = request.data['ticket_route']
        ticket_id = RaiseTicket.objects.filter(route=ticket_route).filter(user_id=id).values()
        if ticket_id.exists():
            for i in ticket_id:
                tic_id = i['id']
                route = i['route']
            serializer = MessageReplySerializer(data=request.data)
            if serializer.is_valid():
                message = serializer.save()
                message.user_message= request.data['user_message']
                message.user_id = id
                message.ticket_route = route
                message.ticket_id = tic_id
                message.is_user = 1
                message.save()
                data['message'] = "success"
                data['status'] = 100
            return Response(data)
        else:
            data['message'] = "error"
            data["status"] = 102
            return Response(data)




