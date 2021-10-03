<template>
  <div class="field">
    <div v-for="y in 10" :key="y">
      <span v-for="x in 20" :key="x">
        <Tile :x="x" :y="y" />
      </span>
    </div>
  </div>
</template>

<script>
import Tile from './Tile.vue'
export default {
  components: { Tile },
  name: 'Field',
  props: {
    width: Number,
    height: Number,
  },
  data() {
    return {
      field: []
    }
  },
  mounted() {
    this.generateField()
  },
  methods: {
    generateField() {
      console.log(123)
    }
  }
}
</script>

<style scoped>
  .field {
    /* border: 1px black solid; */
  }
</style>
