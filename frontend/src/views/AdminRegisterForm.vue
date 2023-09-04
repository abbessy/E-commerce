<template>
  <div class="formulaire">
    <form @submit.prevent="handleSubmit" method="post">
    
    <div class="register-label">Admin Register</div>

     <input :value="FormValues.user_type" type="hidden" name="user_type" id="user_type"><br>

    <label for="name">Name : </label><br>
    <input required type="text" name="name" id="name" v-model.trim="FormValues.name"><br>

    <label for="email">Email : </label><br>
    <input required type="email" name="email" id="email" v-model.trim="FormValues.email"><br>

    <label for="password">Password : </label><br>
    <input required type="password" name="password" id="password" v-model.trim="FormValues.password"><br>

   
    <ErrorMsg v-if="FormValues.error" :error="FormValues.error"/>

    <button>Register</button>


  </form>
  </div>
</template>

<script>
import axios from 'axios'
import ErrorMsg from '../components/ErrorMsg.vue'
export default {
    name: "AdminRegisterForm",
    data() {
        return {
            FormValues: {
                user_type:"admin",
                name: "",
                email: "",
                password: "",
                error:"",
            }
        };
    },
    methods: {
        async handleSubmit() {

            
              const response = await axios.post("/adminRegister", this.FormValues);

              if (response.data.user){
                this.$router.push({ name: "AdminLoginForm" });
              }

              if (response.data.status == 'error'){
               // this.FormValues.error = "Invalid Informations.";
               console.log(response.data)
               
                
              }


          
           
        }
    },
    components: { ErrorMsg }
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
    margin-top: 15px;
    margin-bottom: 8px;
    width: 120px;
    padding: 12px;
    background-color: rgb(255, 255, 255);
    border: 2px solid rgb(197, 121, 7);
    border-radius: 5px;
    cursor: pointer;
    font-family: cursive;
    font-size: 14px;
  }
  button:hover{
    background-color: rgb(250, 250, 248);
    transform: scale(1.05);
  }

  .register-label{
    font-weight: 900;
    font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-size: 26px;
    margin-bottom: 12px;
    color: rgb(143, 54, 2);
  }
</style>