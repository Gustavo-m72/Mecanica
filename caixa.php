
<form action = "" method="post">
    <div>
        <label name = "nome_nome_fantasia">nome/nome fantasia:</label>
        <input type = "text" name = "nome_cliente" id = "nome_cliente" required/>
    </div>
    <div>
        <label name = "CPF_CNPJ">CPF/CNPJ:</label>
        <input type = "text" name = "CPF" id = "CPF" required/>
    </div>
    <div>
    <label name = "des">Calculo de desconto: </label> <br>
        <input type = "submit" value = "fisica" name = "fisica">
        <input type = "submit" value = "juridica" name = "juridica">
    <br><label name = "pag">Verificar pagamento: </label> <br>
        <input type = "submit" value = "fisica" name = "fisica_p">
        <input type = "submit" value = "juridica" name = "juridica_p">
</form>

<form action = "" method="post">
    <div>
    <label name = "des">Verificar maior orçamento: </label> <br>
    <div>
        <input type = "submit" value = "verificar" name = "verificar">
</form>


<?php

    include("conexao.php");
    
    if (isset($_POST['fisica'])) {
        $nome = $_POST['nome_cliente'];
        $CPF = $_POST['CPF'];
        

        $sql = "SELECT count(cliente_idcliente) 
        FROM ordem_servico
        WHERE cliente_idcliente = (
            SELECT idcliente 
            FROM cliente 
            WHERE idcliente = (
                SELECT cliente_idcliente 
                FROM pessoa_fisica 
                WHERE CPF = '$CPF' AND nome = '$nome'
            )
        )";
        $result = mysqli_query($con, $sql);
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            echo '<br>desconto aplicavel de: ' . $row['count(cliente_idcliente)'] . '%';
        }
    }

    
    if (isset($_POST['juridica'])) {
        $nome = $_POST['nome_cliente'];
        $CNPJ = $_POST['CPF'];
        

        $sql = "SELECT desconto
        FROM desconto
        WHERE cliente_idcliente = (
            SELECT idcliente 
            FROM cliente 
            WHERE idcliente = (
                SELECT cliente_idcliente 
                FROM pessoajuridica 
                WHERE CNPJ = '$CNPJ' AND nomefantasia = '$nome'
            )
        )";
        $result = mysqli_query($con, $sql);
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            echo 'desconto aplicavel de: ' . $row['desconto'] * 100 . '%';
        }
    }
    

    /*
    DELIMITER //
    CREATE TRIGGER incrementa_desconto
    AFTER INSERT ON ordem_servico
    FOR EACH ROW
    BEGIN
    UPDATE desconto
    SET count = count + 1,
        desconto = desconto + 0.01
    WHERE cliente_idcliente = NEW.cliente_idcliente;
    END;//
    DELIMITER ;
    */

    /*

    CREATE TRIGGER at_incrementa_desconto
AFTER INSERT ON ordem_servico
FOR EACH ROW
BEGIN
  IF((SELECT count(*) FROM desconto WHERE cliente_idcliente = NEW.cliente_idcliente) = 0)
  THEN 
    INSERT INTO desconto(desconto, count, cliente_idcliente) 
    SELECT count(*)/100, count(*), cliente_idcliente FROM ordem_servico
    WHERE NEW.cliente_idcliente = cliente_idcliente
    GROUP BY NEW.cliente_idcliente;
  END IF;
END

    */

    if (isset($_POST['verificar'])) {
        
        $sqlpj = "SELECT v.placa, pj.nomefantasia, 
        MAX(valor_mao_obra + valor_peca) AS orcamento
        FROM orcamento o inner join  veículo v on o.veículo_id = v.id
        inner join  cliente c on v.cliente_idcliente = c.idcliente
        inner join  pessoajuridica pj on pj.cliente_idcliente = c.idcliente
        GROUP BY v.placa, pj.nomefantasia
        ";
        echo "<br>pessoa juridica: ";
        $result = mysqli_query($con, $sqlpj);
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            foreach($row as $chave => $valor) {
               // if(isset($valor)) {
                    echo "<br>$chave: $valor";
                //}
            }
        }
        $sqlpf = "SELECT v.placa,
        pf.nome, MAX(valor_mao_obra + valor_peca) AS orcamento
        FROM orcamento o inner JOIN veículo v on o.veículo_id = v.id
        inner join cliente c on v.cliente_idcliente = c.idcliente
        inner join pessoa_fisica pf on pf.cliente_idcliente = c.idcliente
        GROUP BY v.placa, pf.nome
        ";
        echo "<br>pessoa fisica: ";
        $result = mysqli_query($con, $sqlpf);
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            foreach($row as $chave => $valor) {
               // if(isset($valor)) {
                    echo "<br>$chave: $valor";
                //}
            }
        }
    }

    if (isset($_POST['fisica_p'])) {
        $nome = $_POST['nome_cliente'];
        $CPF = $_POST['CPF'];
        

        $sql = "SELECT pe.nome, pa.valor, pa.froma, p.valor, p.vencimento, p.parcela
        FROM  pessoa_fisica pe
        inner join pagamento pa on pa.cliente_idcliente = pe.cliente_idcliente
        left join prestacao p on p.pagamento_id = pa.id
        where pe.nome = '$nome'AND CPF = '$CPF'
        ";
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

    if (isset($_POST['juridica_p'])) {
        $nome = $_POST['nome_cliente'];
        $CPF = $_POST['CPF'];
        

        $sql = "SELECT pe.nomefantasia, pa.valor, pa.froma, p.valor, p.vencimento, p.parcela
        FROM  pessoajuridica pe
        inner join pagamento pa on pa.cliente_idcliente = pe.cliente_idcliente
        left join prestacao p on p.pagamento_id = pa.id
        where pe.nomefantasia = '$nome'AND CNPJ = '$CPF'
        ";
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