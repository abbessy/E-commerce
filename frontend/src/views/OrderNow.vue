<template>
    <div>
  <div v-if="user">
    <table border="1">
        <tr>
            <td>
                Amount
            </td>
            <td>
                {{total}}
            </td>
        </tr>

        <tr>
            <td>
                Tax
            </td>
            <td>
                $0
            </td>
        </tr>

        <tr>
            <td>
                Delivery
            </td>
            <td>
                $10
            </td>
        </tr>

        <tr>
            <td>
                Total
            </td>
            <td>
                {{total + 10}}
            </td>
        </tr>

        
    </table>

    <div class="formulaire">
    <form @submit.prevent="handleSubmit" method="post">
        <textarea required placeholder="Enter Your Address" type="address" name="address" id="" cols="70" rows="3" v-model.trim="address"></textarea><br><br>
        <p> <b>PS : Payment Only When Items Are Delivered</b> </p>
        <button>Purchase</button>
    </form>
    </div>
  </div>
  <div v-if="!user" class="not-logged-in">
      You Should Log in To  <span>Order Products</span> 
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
    name:'OrderNow',
    data(){
        return {
            total : "",
            address:""


        }
    },

    methods:{
        async handleSubmit(){
            const res = await axios.post('/items/orderplace',{address : this.address})
            this.$router.push({ name: "MyProducts" });
            alert("Items Shipped Successfully")
            console.log("status" + res.status);
        }
    },
    
    async mounted(){
        const res = await axios.get('/items/ordernowprice');
        this.total = res.data
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
    border: 2px solid rgb(190, 190, 190);
    border-collapse: collapse;
}

table:hover{
    transform: scale(1.01);
}

td{
    text-align: center;
    padding: 10px;
    width: 250px;
    height: 50px;
    font-family:Verdana, Geneva, Tahoma, sans-serif;
    font-size: 12px;
}

.formulaire{
    position: absolute;
    left: 20px;
}

button{
    left: 300px;
    width: 120px;
    padding: 10px;
    background-color: rgb(32, 194, 18);
    border: 2px solid rgb(95, 95, 95);
    color : white;
    border-radius: 5px;
    cursor: pointer;
    font-family: cursive;
    font-size: 14px;
}
 button:hover{
    font-size: 15px;
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
  color: #29508a;
}

</style>>

