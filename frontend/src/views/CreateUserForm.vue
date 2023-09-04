<template>

<div>
    <div v-if="user && user_t=='admin'" class="formulaire">
      <form @submit.prevent="submitForm" method="post">
      
      <label for="name">Name : </label><br>
      <input required type="text" name="name" id="name" v-model.trim="FormValues.name"><br>

      <label for="email">Email : </label><br>
      <input required type="email" name="email" id="email" v-model.number="FormValues.email"><br>

      <label for="password">Password : </label><br>
      <input required type="password" name="password" id="password" v-model.trim="FormValues.password"><br>

      <label for="user_type">User Type : </label><br>
      <input required type="text" name="user_type" id="user_type" v-model.trim="FormValues.user_type"><br><br>

      <button>Add user</button>
      </form>
   </div>

    
     <div v-if="user_t !='admin'" class="not-admin">
      You Should Be An <span>Admin</span> 
     </div>

</div>
</template>


<script>

import axios from 'axios'

export default {

    name : 'CreateUserForm',
    data (){
        return {
            FormValues:{
                name : "",
                email :"",
                password :"",
                user_type:"",
            }
        }
    },
    methods : {

        async submitForm(){
            
        const result = await axios.post("/users/create",this.FormValues)


        this.FormValues.name = ""
        this.FormValues.email = ""
        this.FormValues.password = ""
        this.FormValues.user_type = ""

        if (result.status == 200){
            this.$router.push({name : "MyUsers"});
        }
            
        }
    },

    computed:{
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
    margin-bottom: 10px;
    width: 120px;
    padding: 12px;
    background-color: rgb(255, 255, 255);
    border: 2px solid rgb(4, 145, 51);
    border-radius: 5px;
    cursor: pointer;
    font-family: cursive;
    font-size: 14px;
  }
  button:hover{
    background-color: rgb(246, 255, 248);
    transform: scale(1.05);
  }

  .not-admin{
  font-weight:900;
  font-family:cursive;
  font-size: 45px;
  text-align: center;
  position: absolute;
  top : 270px;
  left: 250px;
}
span{
  color: #c01515;
}
</style>