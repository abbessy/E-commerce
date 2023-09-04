<template>
  <div>
    <table v-if="user">
  <tr>
    <th>Name</th>
    <th>Price</th>
    <th>Description</th>
    <th>Address</th>
    <th>Status</th>
  </tr>
  
   <tr v-for="order in orders" :key="order.id">
    <td>{{order.title}}</td>
    <td>{{order.price}}</td>
    <td>{{order.description}}</td>
    <td>{{order.address}}</td>
    <td>{{order.status}}</td>
    
  </tr>
  </table>

    <div v-if="!user" class="not-logged-in">
      You Should Log in To see <span>Your Orders</span> 
    </div> 

</div>
</template>

<script>
import axios from 'axios';
export default {
    name:'MyOrders',
    data(){
        return{
            orders :[],
        }
    },
    async mounted(){
        const res = await axios.get("items/orders");
        this.orders = res.data;
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
    text-shadow: 2px 2px 5px rgb(244, 252, 140);
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
  color: #63003a;
}
</style>