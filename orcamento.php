<form action = "" method="post">
<label name = "nome_nome">Identificar orçamentos que resultaram em agendamento e os que viraram ordem de
serviço diretamente:</label>
    <div>
        <input type = "submit" value = "buscar" name = "buscar">
    </div>
</form>

<?php

    include("conexao.php");
    
    if (isset($_POST['buscar'])) {
        $sql = "SELECT v.placa, pf.nome, pj.nomefantasia,
        o.id, (valor_mao_obra + valor_peca) AS Total,
        a.id AS id_agendamento, a.data_inicio,
        os.id AS id_ordem_servico, os.entrada
        FROM orcamento o
        INNER JOIN veículo v ON v.id = o.veículo_id
        INNER JOIN cliente c ON c.idcliente = v.cliente_idcliente
        LEFT JOIN ordem_servico os ON os.orcamento_id = o.id
        LEFT JOIN agendamento a ON a.orcamento_id = o.id 
        LEFT JOIN pessoa_fisica pf ON pf.cliente_idcliente = c.idcliente
        LEFT JOIN pessoajuridica pj ON pj.cliente_idcliente = c.idcliente
";
        $result = mysqli_query($con, $sql);
        if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_assoc($result)) {
            foreach($row as $chave => $valor) {
                if(isset($valor)) {
                    echo "$chave: $valor  ";
                }
            }
            echo "<br>";
        }
    }

    }
?>