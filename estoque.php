<form action = "" method="post">
    <div>
        <br><label name = "pag">Verificar peça usada em veículo: </label> <br>
        <label name = "veiculo">Placa:</label>
        <input type = "text" name = "placa" id = "placa"/>
        <input type = "submit" value = "buscar" name = "buscarv">
    </div>
    <div>
    <label name = "des">Buscar peça: </label> <br>   
    <label name = "codigopeca1">Codigo peça:</label>  
        <input type = "text" name = "codigopeca" id = "codigopeca"/>
        <input type = "submit" value = "buscar" name = "buscarp">
    </div> 
    <div>
    <label name = "des">Buscar peça mais utilizadas </label> <br>
        <input type = "submit" value = "buscar" name = "buscaru">
    </div> 

</form>

<?php

    include("conexao.php");
    
    if (isset($_POST['buscarp'])) {
        $codigo = $_POST['codigopeca'];

        $sql = "SELECT p.codigo, p.marca, p.valor,f.nome, f.empresa, f.CNPJ
        FROM compra_peca cp
        inner join peca p on p.id = cp.peca_id
        inner join fornecedor f on f.id = cp.fornecedor_id
        where p.codigo = '$codigo'
       ";
        $result = mysqli_query($con, $sql);
        if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_assoc($result)) {
                foreach($row as $chave => $valor) {
                    echo "  $chave: $valor";
                }
            }
    }   

    }

    if (isset($_POST['buscarv'])) {
        $placa = $_POST['placa'];

        $sql = "SELECT v.placa,m.nome,s.data_ini,s.data_fim, p.codigo, p.marca, p.valor
        FROM veículo v
        inner join ordem_servico o on o.veículo_id = v.id
        inner join servico s on s.ordem_servico_id = o.id
        inner join peca p on p.id = s.peca_id
        inner join mecanico m on s.mecanico_id = m.id
        where v.placa = '$placa'
       ";
        $result = mysqli_query($con, $sql);
        if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_assoc($result)) {
                foreach($row as $chave => $valor) {
                    echo "  $chave: $valor";
                }
            }
    }
}

    if (isset($_POST['buscaru'])) {

        $sql = "SELECT p.aplicacao, p.codigo, p.marca, p.valor, COUNT(*) as quantidade_usos, f.empresa, f.CNPJ
        FROM ordem_servico o
        INNER JOIN servico s ON s.ordem_servico_id = o.id
        INNER JOIN peca p ON p.id = s.peca_id
        inner join compra_peca cp on p.id = cp.peca_id
        inner join fornecedor f on f.id = cp.fornecedor_id
        GROUP BY p.codigo, p.marca, p.valor
        ORDER BY quantidade_usos DESC
       ";
        $result = mysqli_query($con, $sql);
        
        if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_assoc($result)) {
                foreach($row as $chave => $valor) {
                    echo "  $chave: $valor";
                }
            echo '<br>';
            }
    }
}
    
?>