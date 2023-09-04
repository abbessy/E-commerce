<template>
  
  <div>
    <NavBar />

    <div>
      <router-view /> 
    </div>

  </div>
  
</template>

<script>
import NavBar from './components/NavBar.vue';
import axios from 'axios';

export default {
  name: 'App',
  components : {
    NavBar,
},

    async created(){

      const response = await axios.get("/user");

      this.$store.commit('updateUser',response.data);  
      this.$store.commit('updateUserType',response.data.user_type);

    },

 
}
</script>

<style>
  body{
    margin: 0%;
    background-image: url("./assets/background.jpg");
    background-size: cover;
  }
</style>
