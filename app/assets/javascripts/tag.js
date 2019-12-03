<input id="test">

<script>
var a = document.getElementById('test');
a.addEventListener('keyup',addthis);

function addthis() {
    b = a.value.replace('#',''); 
    a.value = '#'+b

    if (a.value.indexOf(' '))
    {
    a.value = a.value.replace(' ','#');
    }

}
</script>