{#
Custom head.
#}
<script type="text/javascript">
window.onload = function(e){
  var urls = "https://picsum.photos/"
  + window.screen.availWidth +
  "/" + window.screen.availHeight + "/?random";
  document.body.style.backgroundImage='url('+urls+')';
}
</script>
