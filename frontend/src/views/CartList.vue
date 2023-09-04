<template>
  <div>

<table v-if="user">
  <tr>
    <th>Id</th>
    <th>Title</th>
    <th>Price</th>
    <th>Description</th>
    <th>Delete</th>
  </tr>
  

   <tr v-for="userItem in userItems" :key="userItem.id">
    <td><b>{{userItem.id}}</b></td>
    <td>{{userItem.title}}</td>
    <td>{{userItem.price}}</td>
    <td>{{userItem.description}}</td>
    <td ><i class="fa fa-trash" aria-hidden="true" @click="handleDelete(userItem.cart_id)"></i></td> 
  </tr>
  </table>

  <router-link to='/ordernow'>Order Now</router-link>

  </div>
</template>

<script>
import axios from 'axios'
export default {
    name : 'CartList',
     data(){
        return{
            userItems : [],
        }
    },
    methods : {
        
         getItemsPerUser(){
            axios.get("/cartlist")
            .then((res) => {
               this.userItems = res.data
            }).catch((err) => {
                console.error(err)
            });
        },

           handleDelete(id){
            axios.delete("/items/delete/"+id)
            .then((res) => {
                console.log(res.data.id)
            }).catch((err) => {
                console.error(err)
            });
            
            this.getItemsPerUser();
        }
    },
       
    mounted(){
        this.getItemsPerUser();
       
    },
    computed:{
        user(){
          return this.$store.state.user;
        },
    }
}
</script>

<style scoped>

table{
    margin: 20px;
    border: 2px solid black;
    border-collapse: collapse;
}

table:hover{
    transform: scale(1.01);
}

td{
    text-align: center;
    width: 290px;
    height: 50px;
    font-family:Verdana, Geneva, Tahoma, sans-serif;
    font-size: 12px;

}

th{
    text-align: center;
    padding: 20px;
    font-family: cursive;
    font-size: 16px;
    text-shadow: 2px 2px 5px rgb(158, 23, 170);
}


.fa-trash{
    cursor: pointer;
    color : rgb(207, 30, 30);
    font-size: 18px;
}
.fa-trash:hover{
   transform: scale(1.2);
}

a{
    text-decoration: none;
    position: relative;
    top: 20px;
    left: 150px;
    width: 120px;
    padding: 12px;
    background-color: rgb(32, 194, 18);
    border: 2px solid rgb(95, 95, 95);
    color : white;
    border-radius: 5px;
    cursor: pointer;
    font-family: cursive;
    font-size: 14px;
}
 a:hover{
    font-size: 15px;
}

</style>