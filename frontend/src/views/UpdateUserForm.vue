<template>
<div>
  <div v-if="user && user_t=='admin'" class="formulaire">  
    <form @submit.prevent="" method="post">

    <label for="name">Name : </label><br>
    <input required type="text" name="name" id="name" v-model.trim="FormValues.name"><br>

    <label for="email">email : </label><br>
    <input required type="email" name="email" id="email" v-model.trim="FormValues.email"><br>

    <label for="user_type">User Type : </label><br>
    <input required type="text" name="user_type" id="user_type" v-model.trim="FormValues.user_type"><br>
    
    <label for="Password">Password : </label><br>
    <input required placeholder="Enter new password" type="password" name="password" id="password" v-model.trim="FormValues.password"><br>
    
    <button @click="handleUpdate">Update</button><br>

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

    name : 'UpdateUserForm',
    data (){
        return {
            FormValues:{
                name : "",
                email :"",
                user_type :"",
                password:"",
            }
        }
    },
    methods : {
    async handleUpdate(){
    const result = await axios.post("/users/update/"+this.$route.params.id,this.FormValues)
    
    if (result.status == 200){
        this.$router.push({name : "MyUsers"});
    }
       

    }
    }, 

  async  mounted(){
        
        const result = await axios.get("/users/"+this.$route.params.id)
        this.FormValues = result.data;
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
    margin-top : 10px;
    margin-bottom: 10px;
    width: 120px;
    padding: 12px;
    background-color: rgb(255, 255, 255);
    border: 2px solid rgb(205, 223, 15);
    cursor: pointer;
    font-family: cursive;
    font-size: 14px;
  }
  button:hover{
    background-color: rgb(246, 248, 232);
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
    color: #d838c3;
  }

</style>