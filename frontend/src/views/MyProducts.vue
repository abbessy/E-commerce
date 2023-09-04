<template>
<div>

    <div v-if="user" class="products">
        <div v-for="product in products" :key="product.id" class="product">
            <h3>{{product.title}}</h3>   
            <b>{{product.price}}</b> 
            <p>{{product.description}}</p> 
            <i class="fa fa-times" v-if="user_t=='admin'" @click="handleDelete(product.id)"></i>
            
            <router-link v-if="user_t=='admin'" :to="'/update/'+product.id" class="Updatebutton">Update</router-link> <br><br>        
            <form @submit.prevent="submitForm" method="post" v-if="user_t!='admin'">
            <input type="hidden" name="product_id" :value="product.id">
            <button>Add to cart</button>  <br><br>
            </form>
        </div>
    </div>

    <div v-if="!user" class="not-logged-in">
      You Should Log in To see <span>The Products</span> 
    </div> 
</div>
</template>

<script>
import axios from 'axios'
export default {
    name : "MyProducts",
    data(){
        return{
            products : [],
            product_id :"",
        }
    },
    methods : {
        getProducts(){
            axios.get("/products")
            .then((res) => {
               this.products = res.data
            }).catch((err) => {
                console.error(err)
            });
        },
        handleDelete(id){
            axios.delete("/products/delete/"+id)
            .then((res) => {
                console.log(res.data)
            }).catch((err) => {
                console.error(err)
            });

            this.getProducts();
        },

        async submitForm(e){
            
            const result = await axios.post("/addtocart",{product_id:e.target[0]._value})
            console.log("user " + result.data.user_id + " adds to his cart");
            
        },
    } , 
    mounted (){
         this.getProducts()
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
.products {
    display: flex;
    flex-wrap: wrap;
    position: absolute;
    top: 100px;
    left : 70px;
   

}

.product {
    position: relative;
    border: 2px rgb(27, 27, 27) solid;
    border-radius: 5px;
    margin: 20px;
    width : 250px;
    height: 230px;
    text-align: center;
    padding-top: 20px;
    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
}

.product:hover {
    cursor: pointer;
    background: rgb(245, 244, 244);
    transition: 0.2s;
    transform: scale(1.06);
    border: 2px solid;
    border-color: rgb(46, 126, 87);
    font-size: 16px;
    font-family: cursive;
    
}

.fa-times{
    position :relative;
    bottom : 170px;
    left : 160px;
    background-color: rgb(252, 144, 144);
    padding: 7px;
    border-radius: 100%;
    color : rgb(255, 255, 255);
    cursor: pointer;
    font-size: 15px;
    margin-top: 30px;
    margin-right: 30px;
}
.fa-times:hover{
    transition: 0.3s;
    transform: scale(1.3);
    
}

.Updatebutton{
    position: relative;
    right: 25px;
    text-decoration: none;
    text-align: center;
    font-size: 16px;
    font-family: cursive;
    border: 2px rgb(61, 94, 0) solid;
    border-radius: 5px;
    padding: 12px;
    color : rgb(85, 85, 5);
}

.Updatebutton:hover{
    background-color: rgb(255, 248, 215);
    transition: 0.5s;
}

button{
    cursor: pointer;
    position: relative;
    bottom : 32px;
    text-decoration: none;
    text-align: center;
    font-size: 16px;
    font-family: cursive;
    border: 2px rgb(61, 94, 0) solid;
    border-radius: 5px;
    padding: 12px;
    color : rgb(85, 85, 5);
}

button:hover{
    background-color: rgb(255, 248, 215);
    transition: 0.5s;
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
</style>