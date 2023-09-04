import { createRouter, createWebHistory } from 'vue-router'
import CreateProductForm from '../views/CreateProductForm.vue'
import UpdateProductForm from '../views/UpdateProductForm.vue'
import MyProducts from '../views/MyProducts.vue'
import UserLoginForm from '../views/UserLoginForm.vue'
import UserRegisterForm from '../views/UserRegisterForm.vue'
import AdminLoginForm from '../views/AdminLoginForm.vue'
import AdminRegisterForm from '../views/AdminRegisterForm.vue'
import HomePage from '../views/HomePage.vue'
import MyUsers from '../views/MyUsers.vue'
import UpdateUserForm from '../views/UpdateUserForm.vue'
import CreateUserForm from '../views/CreateUserForm.vue'
import CartList from '../views/CartList.vue'
import OrderNow from '../views/OrderNow.vue'
import MyOrders from '../views/MyOrders.vue'


const routes = [
  {
    path: '/',
    name: 'HomePage',
    component: HomePage,
  },
  {
    path: '/myproducts',
    name: 'MyProducts',
    component: MyProducts
  },
  {
    path: '/createProduct',
    name: 'CreateProductForm',
    component: CreateProductForm,
  },
  {
    path: '/update/:id',
    name: 'UpdateProductForm',
    component: UpdateProductForm,
  },
  {
    path: '/userLogin',
    name: 'UserLoginForm',
    component: UserLoginForm,
  },
  {
    path: '/userRegister',
    name: 'UserRegisterForm',
    component: UserRegisterForm,
  },
  {
    path: '/adminLogin',
    name: 'AdminLoginForm',
    component: AdminLoginForm,
  },
  {
    path: '/adminRegister',
    name: 'AdminRegisterForm',
    component: AdminRegisterForm,
  },
  {
    path: '/myusers',
    name: 'MyUsers',
    component: MyUsers,
  },
  {
    path: '/updateUser/:id',
    name: 'UpdateUserForm',
    component: UpdateUserForm,
  },
  {
    path: '/createUser',
    name: 'CreateUserForm',
    component: CreateUserForm,
  },
  {
    path: '/cartlist',
    name: 'CartList',
    component: CartList,
  },
   {
    path: '/ordernow',
    name: 'OrderNow',
    component: OrderNow,
  },
  {
    path: '/myorders',
    name: 'MyOrders',
    component: MyOrders,
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
