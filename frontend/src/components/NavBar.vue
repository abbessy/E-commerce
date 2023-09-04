<template>
   <header>
     <router-link to="/"><h1>INSTA<span>SHOPS</span></h1></router-link>
      <nav>
        <ul v-if="!user">
          <li><router-link to='/adminLogin'>Admin Login</router-link></li>
          <li><router-link to='/adminRegister'>Admin Register</router-link></li>
          <li><router-link to='/userLogin'>User Login</router-link></li>
          <li><router-link to='/userRegister'>User Register</router-link></li>
          
        </ul>

        <ul v-if="user">
          <li v-if="user_t=='admin'"><router-link to='/createUser'>Add a User</router-link></li>
          <li v-if="user_t=='admin'"><router-link to='/createProduct'>Create a Product</router-link></li>
          <li v-if="user_t=='admin'"><router-link to='/myusers'>Users</router-link></li>
          <li><router-link to='/myproducts'>Products</router-link></li>
          <li v-if="user_t!='admin'"><router-link to='/cartlist'><i class="fa fa-shopping-cart"></i>({{itemCounter}})</router-link></li>
          <li v-if="user_t!='admin'"><router-link to='/myorders'>Orders</router-link></li>
          <li><router-link to='' @click="handleLogOut">Logout</router-link></li>
        </ul>
      </nav>
   </header>
</template>

<script>
import axios from 'axios';
export default {
    name : "NavBar", 
    data(){
      return{
        itemCounter : ""
      }
    },
    methods:{
      handleLogOut(){
        localStorage.removeItem('token');
        this.$router.push({name:'HomePage'})

        this.$store.commit('updateUser',null);
      },

      async getItemsCount(){
        const response = await axios.get("/itemCounter");
        this.itemCounter = response.data;
      }
    },
    computed : {
      user(){
        return this.$store.state.user;
      },
       user_t(){
        return this.$store.state.user_t;
      }
    },
    mounted () {
      this.getItemsCount();
    }
}
</script>

<style scoped>

header{
  width : 100%;
  height: 70px;
  background: rgb(2,0,36);
  background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,121,83,1) 53%, rgba(0,212,255,1) 100%);
}

h1{
  font-size: 35px;
  position: absolute;
  padding: 3px;
  float : left;
  margin-left : 2%;
  margin-top: 10px;
  font-family: Georgia, 'Times New Roman', Times, serif;
  color: #39ca74;
}
span{
  color : white;
}

ul {
  width : auto;
  float: right;
  margin-top : 8px;

}

li {
  display: inline-block;
  padding : 15px 30px;

}

a{
  text-align: center;
  color : white ; 
  text-decoration: none;
  font-family: cursive;
  font-size: 15px;
}

a:hover {
  color : #39ca74;
  transition: 0.5s;
}


</style>