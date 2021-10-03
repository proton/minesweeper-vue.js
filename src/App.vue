<template>
  <Field :width="20" :height="10" :minesCount="70" />
</template>

<script>
import Field from './components/Field.vue'

export default {
  name: 'App',
  components: {
    Field
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
