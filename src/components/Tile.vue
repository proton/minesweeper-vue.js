<template>
  <div class="tile">
  </div>
</template>

<script>
export default {
  name: 'Tile',
  props: {
    x: Number,
    y: Number,
  }
}
</script>

<style scoped>
  .tile {
    display: inline-block;
    width: 40px;
    height: 40px;
    border: 1px solid black;
    text-align: center;
    font-size: 40px;
    /* background: red; */
    /* border-radius: 3px; */
    cursor: pointer;
  }
  .tile:before {
    content: '💣';
  }
</style>
