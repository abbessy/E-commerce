<template>
<div>
    <table v-if="user && user_t =='admin'">
  <tr>
    <th>Name</th>
    <th>Email</th>
    <th>User Type</th>
    <th>Delete</th>
    <th>Update</th>
  </tr>
  

   <tr v-for="user in users" :key="user.id">
    <td>{{user.name}}</td>
    <td>{{user.email}}</td>
    <td>{{user.user_type}}</td>
    <td><i class="fa fa-trash" aria-hidden="true" v-if="user_t=='admin'" @click="handleDelete(user.id)"></i></td> 
    <td><router-link v-if="user_t=='admin'" :to="'/updateUser/'+user.id" ><i class="fa fa-paint-brush" aria-hidden="true"></i></router-link></td> <br><br>
  </tr>
  </table>

    <div v-if="!user" class="not-logged-in">
      You Should Log in To see <span>The Users</span> 
    </div> 

    <div v-if="user_t !='admin' && user" class="not-admin">
      You Should Be An <span>Admin</span> 
    </div>
</div>
</template>

<script>
import axios from 'axios'
export default {
    name : "MyUsers",
    data(){
        return{
            users : [],
        }
    },
    methods : {
        getUsers(){
            axios.get("/users")
            .then((res) => {
               this.users = res.data
            }).catch((err) => {
                console.error(err)
            });
        },
        handleDelete(id){
            axios.delete("/users/delete/"+id)
            .then((res) => {
                console.log(res.data)
            }).catch((err) => {
                console.error(err)
            });

            this.getUsers();
        }
    } , 
    mounted (){
         this.getUsers()
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
    text-shadow: 2px 2px 5px rgb(149, 250, 171);
}


.fa-trash{
    cursor: pointer;
    color : rgb(228, 42, 42);
    font-size: 18px;
}
.fa-trash:hover{
   transform: scale(1.2);
}

.fa-paint-brush{
    cursor: pointer;
    color : rgb(231, 202, 36);
    font-size: 18px;
}
.fa-paint-brush:hover{
    transform: scale(1.2);
}


.not-logged-in{
  font-weight:900;
  font-family:cursive;
  font-size: 45px;
  text-align: center;
  position: absolute;
  top : 270px;
  left: 100px;
}
span{
  color: #09a146;
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
  color: #7a00cc;
}
</style>