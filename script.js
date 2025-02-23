$(document).ready(function() {

    $("#Chat").hide();

    window.addEventListener('message', function(event) {
        var data = event.data;
        switch (data.action) {
            case "show":
                $("#Chat").show(); 
                $("#Chat").focus(); 
                break;

            case "hide":
                $("#Chat").hide(); 
                break;

            default:
                console.log("Error: Unbekannte Aktion");
                break;
        }
    });

    $(document).on('keyup', function(event) {
        if (event.which == 13) {
            let inputValue = $("#Chat").val(); 
            $("#Chat").val(""); 
            $("#Chat").hide(); 
            $.post('https://New_Chat/removeFocus', JSON.stringify({}));

            if (inputValue.startsWith("/")) {
                $.post('https://New_Chat/message', JSON.stringify({ input: inputValue }));
              
            }
        }
    });
});
