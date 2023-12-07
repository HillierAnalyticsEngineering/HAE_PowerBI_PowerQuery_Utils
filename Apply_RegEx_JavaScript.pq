let
    Apply_RegEx_JavaScript = (Target, RegularExpression) => 
        Web.Page(
        "<script>
            var Target = " & Target & ";
            var RegularExpression = new RegExp('" & RegularExpression & "','g');
            var matchString = Target.match(RegularExpression);
            document.write(matchString);
        </script>"
        )[Data]{0}[Children]{0}[Children]{1}[Text]{0}
in 
    Apply_RegEx_JavaScript