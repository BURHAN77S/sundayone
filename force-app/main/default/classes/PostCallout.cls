public with sharing class PostCallout {
    public static void post() {
        HttpRequest Request = new HttpRequest();

        Request.setEndpoint('https://gorest.co.in/public/v2/posts');

        Request.setMethod('POST');

        Request.setHeader('Authorization', 'Bearer c6a9d163da4c7e4e5434c447de5f6e2c63091b328a902d94a654cd090a614927');

        request.setHeader('Content-Type', 'application/json');

        Post__c post = [Select Id, User_ID__c, Title__c, Body__c from Post__c where CreatedDate = TODAY LIMIT 1];

        PostWrapper pstw = new PostWrapper();
        pstw.user_id = Integer.valueOf(Post.User_ID__c);
        pstw.title = Post.Title__c;
        pstw.body = Post.Body__c;
        Request.setBody(JSON.serialize(pstw));

        Http http = new Http();

        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 201) {
            System.debug(response.getBody());
        }else{
            System.debug('Something went wrong!');
        }
    }
    Public class PostWrapper {
        public Integer user_id;
        public String title;
        public String body;
    }
}