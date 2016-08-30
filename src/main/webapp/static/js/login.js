
//登陆接口
var loginurl='/login/login';
var login=new Vue({
    el:'#loginform',
    data:{
        userName:'',
        password:'',
        code:'',
        error:'',
        validCode:'/login/getNewValidCode'
    },
    methods:{
        getnewValidCode:function(){
            var a=new Date();
            var m= a.getMilliseconds();
            login.validCode='/register/getNewValidCode?id='+m;
        },
        clearerror:function(){
            login.error='';
        },
        post:function(){
            if(login.username==''||login.psw==''||login.code==''){
                login.error='必填,不能为空';
            }else{
                $.ajax({
                    type:'post',
                    url:loginurl,
                    dataType:'json',
                    data:{
                        userName:login.userName,
                        passWord:login.password,
                        validCode:login.validCode
                    },
                    success:function(data){
                        if(data.status=='0'){
                            //login.error='登陆名或密码错误';
                            alert('data.status:'+data.status);
                            alert('data.error:'+data.error);
                        }
                        if(data.status=='1'){
                            alert('登陆成功,你好 ');
                            location.replace("/index.html");
                        }
                        //self.location='index.html';
                    }

                });
            }

        }
    }
});