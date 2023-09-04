<template>
  <div  class="error">
          {{error}}
      </div>
</template>

<script>
export default {
    name:"ErrorMsg",
    props:['error']
}
</script>

<style scoped>

 .error{
    position: relative;
    left: 110px;
    color: brown;
    background-color: rgb(250, 235, 235);
    width:200px;
    padding: 15px;
    margin : 20px;
  }

</style>