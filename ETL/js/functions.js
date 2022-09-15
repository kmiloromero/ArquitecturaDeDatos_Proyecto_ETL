function doSearch() {
    const tableReg = document.getElementById('datos');
    const searchText = document.getElementById('searchTerm').value.toLowerCase();
    let total = 0;

    // Recorremos todas las filas con contenido de la tabla

    for (let i = 1; i < tableReg.rows.length; i++) {
        // Si el td tiene la clase "noSearch" no se busca en su cntenido
        if (tableReg.rows[i].classList.contains("noSearch")) {
            continue;
        }
        let found = false;

        const cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
        // Recorremos todas las celdas

        for (let j = 0; j < cellsOfRow.length && !found; j++) {
            const compareWith = cellsOfRow[j].innerHTML.toLowerCase();
            // Buscamos el texto en el contenido de la celda
            if (searchText.length == 0 || compareWith.indexOf(searchText) > -1) {
                found = true;
                total++;
            }
        }

        if (found) {
            tableReg.rows[i].style.display = '';
        } else {
            // si no ha encontrado ninguna coincidencia, esconde la
            // fila de la tabla
            tableReg.rows[i].style.display = 'none';
        }
    }

    // mostramos las coincidencias

    const lastTR=tableReg.rows[tableReg.rows.length-1];
    const td=lastTR.querySelector("td");
    lastTR.classList.remove("hide", "red");

    if (searchText == "") {
        lastTR.classList.add("hide");
    } else if (total) {
        td.innerHTML="Se ha encontrado "+total+" coincidencia"+((total>1)?"s":"");
    } else {
        // lastTR.classList.add("red");
        td.innerHTML="No se han encontrado coincidencias";
    }

}

$(document).ready(function() {
    $("#insertdata").hide();
    $("#tablaid").hide();
    $('input[type="button').click(function(e) {
        console.log(e.target.id);
        console.log(e.target.dirName);
        if(e.target.dirName == "ConsultarL"){
            console.log("Muestra datos limpios");
            $("#tablaid").show();
            $("#insertdata").hide();
            $('#datos tr:not(:first)').remove();
                $.ajax({
                    type: "POST",
                    url: 'php/actions.php',
                    data: "action=selectl",
                    success: function(response)
                    {   
                        if(response){
                            $("#datos tbody").append(response);
                        }
                }
            });
        }
        else if(e.target.dirName == "ConsultarS"){
            console.log("Muestra datos sucios");
            $("#tablaid").show();
            $("#insertdata").hide();
            $('#datos tr:not(:first)').remove();
                $.ajax({
                    type: "POST",
                    url: 'php/actions.php',
                    data: "action=selects",
                    success: function(response)
                    {   
                        if(response){
                            $("#datos tbody").append(response);
                        }
                }
            });
        }
        else if(e.target.dirName == "Ingresar"){
            $("#tablaid").hide();
            $("#insertdata").show();
            console.log("Ingresa datos limpios");
        //     $.ajax({
        //         type: "POST",
        //         url: 'login.php',
        //         data: $(this).serialize(),
        //         success: function(response)
        //         {
        //             var jsonData = JSON.parse(response);
    
        //             // user is logged in successfully in the back-end
        //             // let's redirect
        //             if (jsonData.success == "1")
        //             {
        //                 location.href = 'my_profile.php';
        //             }
        //             else
        //             {
        //                 alert('Invalid Credentials!');
        //             }
        //     }
        // });
        }else if(e.target.id == "goback"){
            $("#insertForm").trigger("reset");
            $("#insertdata").hide();
        }else if(e.target.id == "gosave"){
            $.ajax({
            type: "POST",
            url: 'php/actions.php',
            data: $("#insertForm").serialize(),
                success: function(response){
                    // var jsonData = JSON.parse(response);
                    $("#response").append(response);
                    // user is logged in successfully in the back-end
                    // let's redirect
                    // if (jsonData.success == "1"){
                    //     location.href = 'my_profile.php';
                    // }
                    // else{
                    //     alert('Invalid Credentials!');
                    // }
                }
            });
            $("#insertForm").trigger("reset");
            $("#insertdata").hide();
        }
        // e.preventDefault();
    
     });
});