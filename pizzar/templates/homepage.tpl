<!DOCTYPE HTML>
<html>
    <head>
        <title>HomePage::PizzarFucker</title>
        <link rel="stylesheet" href="static/pizza.css" type="text/css">
    </head>
    <body>
        <header>
            <h1>Pizza Fucker!</h1>
            <p>--Your best fucker for pizza.</p>
        </header>
        
        <div id="productlist">
            <table class = "list">
                <caption>Productlist</caption>
                %if productlist:
            <tr>
                    % for key in ["Nummer", "Name", "Description", "Preis_S", "Preis_M","Preis_L"]:
            <td>{{key}}</td>
                    % end
            </tr>
                    % for row in productlist[1:]:
            <tr>
                        % for value in row:
            <td> {{value}} </td>
                        % end
            </tr>
                    % end
            </table>
        </div>
        
        <div id="opentime">
            <em>Our Open Time:</em>
            <p>Mo.-Fr: 8:30 - 20:00</p>
            <p>Sa.Su: 10:00 - 18:00</p>
        </div>
    </body>
</html>
