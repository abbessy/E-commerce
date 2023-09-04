<template>
  <div>
    <h1>WELCOME TO <span>OUR WEBSITE</span> </h1>

    <div v-if="user" class="logged-in">
      You can Now Add New Items To <span>Your Cart</span> 
    </div> 
    
    <div v-if="!user" class="not-logged-in">
      You Should Log in To see <span>The Products</span> 
       
    </div> 
  </div>
</template>

<script>
export default {
    name:"HomePage",
    computed : {
      user(){
        return this.$store.state.user;
      }
    }
}
</script>

<style scoped>

h1{
  font-family:Georgia, 'Times New Roman', Times, serif;
  font-size: 58px;
  text-align: center;
  position: relative;
  top : 100px;
  color: #797c79;
}

.not-logged-in{
  font-weight:900;
  font-family:cursive;
  font-size: 28px;
  text-align: center;
  position: relative;
  top : 150px;
}

.logged-in{
  font-weight:900;
  font-family:cursive;
  font-size: 28px;
  text-align: center;
  position: relative;
  top : 150px;
}

span{
  color: #09a146;
}

</style>