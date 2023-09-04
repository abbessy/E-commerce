<template>
  <div>
    <div v-if="user && user_t=='admin'" class="formulaire">  
    <form @submit.prevent="" method="post">

    <label for="title">Title : </label><br>
    <input type="text" name="title" id="title" v-model.trim="FormValues.title"><br>

    <label for="price">Price : </label><br>
    <input type="text" name="price" id="price" v-model.number="FormValues.price"><br>

    <label for="description">Description : </label><br>
    <input type="text" name="description" id="description" v-model.trim="FormValues.description"><br>

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

    name : 'UpdateProductForm',
    data (){
        return {
            FormValues:{
                title : "",
                price :"",
                description :"",
            }
        }
    },
    methods : {
    async handleUpdate(){
    const result = await axios.post("/products/update/"+this.$route.params.id,this.FormValues)
    
    if (result.status == 200){
        this.$router.push({name : "MyProducts"});
    }
       

    }
    }, 

  async  mounted(){
        
        const result = await axios.get("/products/"+this.$route.params.id)
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
    color: #d5d838;
  }

</style>