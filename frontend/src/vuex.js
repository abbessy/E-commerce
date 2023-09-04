
import { createStore } from 'vuex'

const store = createStore({
    state:{
        user : null,
        user_t:""
    },
    
    mutations:{
        updateUser(state,payload){
            state.user = payload;
        },

         updateUserType(state,payload){
            state.user_t = payload;
        }
    }
});

export default store;