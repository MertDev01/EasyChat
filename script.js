
window.addEventListener('message', function(event) {
    var data = event.data
    switch (data.action) {
        case "show":
            $("#Chat").show();
            break;

        case "hide":
            $("#Chat").hide();
            break;

        default:
            console.log("Error")
            break;
    }
})


window.onload = function() {
    document.getElementById("Chat").focus();
}

document.onkeyup = function (data) {
    if (data.which == 13) {
        $("#Chat").val("");
        $("#Chat").hide();
        let inputValue = $("#Chat").val();

         if (inputValue.startsWith("/")) {
            $.post('https://Chat/message', JSON.stringify({input: inputValue}));
      }
      
    }
}