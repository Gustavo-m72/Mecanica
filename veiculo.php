<form action = "" method="post">
<label name = "nome_nome">Identificar entrega:</label>
    <div>
        <label name = "nome_nome_placa">placa:</label>
        <input type = "text" name = "placa" id = "placa" required/>
    </div>
    <div>
        <label name = "CPF_CNPJ">CPF/CNPJ:</label>
        <input type = "text" name = "CPF" id = "CPF" required/>
        <input type = "submit" value = "buscar" name = "buscar">
    </div>
</form>

<?php

    include("conexao.php");
    
    if (isset($_POST['buscar'])) {
        $placa = $_POST['placa'];
        $CPF = $_POST['CPF'];
        

        $sql = "SELECT o.saida,
        v.placa,
        pf.nome,pf.CPF,
        pj.CNPJ, pj.nomefantasia,
        c.contato
        FROM ordem_servico o
        INNER JOIN veículo v ON v.id = o.veículo_id
        INNER JOIN cliente c ON c.idcliente = v.cliente_idcliente
        LEFT JOIN pessoa_fisica pf ON pf.cliente_idcliente = c.idcliente
        LEFT JOIN pessoajuridica pj ON pj.cliente_idcliente = c.idcliente
        where v.placa = '$placa' AND pf.CPF = '$CPF' or pj.CNPJ = '$CPF'";
        $result = mysqli_query($con, $sql);
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            foreach($row as $chave => $valor) {
                if(isset($valor)) {
                    echo "<br>$chave: $valor";
                }
            }
        }
    }
?>