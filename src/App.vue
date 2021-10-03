<template>
  <Field :width="width" :height="height" :minesCount="minesCount" />
  <br/>
  <div>
    Size: 
    <input type="number" v-model="width"> x 
    <input type="number" v-model="height">
    Mines:
    <input type="number" v-model="minesCount">
  </div>
</template>

<script>
import Field from './components/Field.vue'

export default {
  name: 'App',
  components: {
    Field
  },
  data() {
    return {
      width: 20,
      height: 10,
      minesCount: 70,
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
