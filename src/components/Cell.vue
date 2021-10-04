<template>
  <div class="cell" :class="classes()" @click="onClick" @contextmenu.prevent="onRightClick"></div>
</template>

<script>
export default {
  name: 'Cell',
  props: {
    x: Number,
    y: Number,
    cell: Object,
    gameOver: Boolean,
  },
  emits: ['clicked', 'rightClicked'],
  methods: {
    classes() {
      let h = {}
      if (this.cell) {
        if (this.cell.bomb) h['cell-bomb'] = true
        if (this.cell.error) h['cell-error'] = true
        if (this.cell.visible) h['cell-visible'] = true
        if (this.cell.flag) h['cell-flag'] = true
        if (this.cell.success) h['cell-success'] = true
        if (this.cell.n) h[`cell-${this.cell.n}`] = true
      }
      return h
    },
    onClick() {
      this.$emit('clicked', {x: this.x, y: this.y})
    },
    onRightClick() {
      this.$emit('rightClicked', {x: this.x, y: this.y})
    },
  }
}
</script>

<style scoped>
  .cell {
    display: inline-block;
    width: 40px;
    height: 40px;
    border: 1px solid black;
    text-align: center;
    font-size: 40px;
    padding: 0;
    margin: 0;
    /* background: red; */
    /* border-radius: 3px; */
    cursor: pointer;
    overflow: hidden;
    background: #eeeeee;
  }
  .cell.cell-flag {
    cursor: default;
  }
  .cell.cell-flag:before {
    content: '🚩';
  }
  .cell.cell-visible {
    cursor: default;
    background: white;
  }
  .cell:before {
    content: ' ';
  }
  .cell.cell-visible.cell-error {
    background: red;
  }
  .cell.cell-visible.cell-success {
    background: green;
  }
  .cell.cell-visible.cell-bomb:before {
    content: '💣';
  }
  .cell.cell-visible.cell-1:before {
    content: '1';
  }
  .cell.cell-visible.cell-2:before {
    content: '2';
  }
  .cell.cell-visible.cell-3:before {
    content: '3';
  }
  .cell.cell-visible.cell-4:before {
    content: '4';
  }
  .cell.cell-visible.cell-5:before {
    content: '5';
  }
  .cell.cell-visible.cell-6:before {
    content: '6';
  }
  .cell.cell-visible.cell-7:before {
    content: '7';
  }
  .cell.cell-visible.cell-8:before {
    content: '8';
  }
</style>
