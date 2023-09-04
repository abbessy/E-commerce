<template>
   <div class="formulaire">
    <form @submit.prevent="handleSubmit" method="post">

     <div class="login-label">User Login</div>
    
    <label for="email">Email : </label><br>
    <input  required type="email" name="email" id="email" v-model.trim="FormValues.email"><br>

    <label for="password">Password : </label><br>
    <input required type="password" name="password" id="password" v-model.trim="FormValues.password"><br>

     <ErrorMsg v-if="FormValues.error" :error="FormValues.error"/>

    <button>Login</button>


  </form>
  </div>
</template>

<script>
import axios from 'axios'

import ErrorMsg from '../components/ErrorMsg.vue'
export default {
    name : "UserLoginForm",
    components : {
    ErrorMsg,
},
    data(){
        return {
            FormValues:{
                email : "",
                password :"",
                error:''
            }
        }
    },
    methods : {
      async handleSubmit(){
        
        try {
        const response = await axios.post("/login",this.FormValues);

        localStorage.setItem('token',response.data.access_token);

        this.$router.push({name : "HomePage"});

        this.$store.commit('updateUser',response.data.user);
        this.$store.commit('updateUserType','user');

        }
        catch(e){
          this.FormValues.error = "Invalid Email/Password.";

        }
      }
    },

    computed : {
      user(){
        return this.$store.state.user;
      },
      user_t(){
        return this.$store.state.user_t;
      }
    }
  
}
</script>

<style scoped>
  .formulaire{
    padding : 20px;
    position: absolute;
    left: 250px;
    top: 160px;
    width: 500px;
    border : 1px black solid;
    border-radius: 15px;
    text-align: center;
  }
  label {
    font-family: cursive;
    font-size: 16px;
  }

  input{
    margin: 10px;
    padding : 10px;
    width : 300px
  }

  button{
    margin-top: 20px;
    margin-bottom: 7px;
    width: 120px;
    padding: 12px;
    background-color: rgb(255, 255, 255);
    border: 2px solid rgb(7, 9, 122);
    border-radius: 5px;
    cursor: pointer;
    font-family: cursive;
    font-size: 14px;
  }
  button:hover{
    background-color: rgb(247, 251, 255);
    transform: scale(1.05);
  }

  .login-label{
    font-weight: 900;
    font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-size: 26px;
    margin-bottom: 30px;
    color: rgb(3, 3, 128);
  }
</style>