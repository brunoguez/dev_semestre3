package exOO.ex5;

import exOO.formEx1;
import javax.swing.JFrame;

public class FrmAnimal extends javax.swing.JFrame {

    public FrmAnimal() {
        initComponents();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        cmbAnimal = new javax.swing.JComboBox<>();
        txtCor = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txtRaca = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txtIdade = new javax.swing.JTextField();
        lblQuantidade = new javax.swing.JLabel();
        txtQuantidade = new javax.swing.JTextField();
        btnFechar = new javax.swing.JButton();
        btnMostrar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        jLabel1.setText("Animais do Mário");

        jLabel2.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel2.setText("Cor");

        cmbAnimal.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        cmbAnimal.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Camelo", "Camaleão", "Onça", "Cachorro" }));
        cmbAnimal.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cmbAnimalItemStateChanged(evt);
            }
        });

        txtCor.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel3.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel3.setText("Animal");

        txtRaca.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel4.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel4.setText("Raça");

        jLabel5.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel5.setText("Idade");

        txtIdade.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        lblQuantidade.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        lblQuantidade.setText("Quantidade");

        txtQuantidade.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        btnFechar.setText("Fechar");
        btnFechar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnFecharActionPerformed(evt);
            }
        });

        btnMostrar.setText("Mostrar");
        btnMostrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMostrarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(102, 102, 102)
                        .addComponent(jLabel1))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(65, 65, 65)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(cmbAnimal, javax.swing.GroupLayout.PREFERRED_SIZE, 181, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtCor))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtRaca))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel5)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtIdade))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(lblQuantidade)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtQuantidade))))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(96, 96, 96)
                        .addComponent(btnFechar)
                        .addGap(28, 28, 28)
                        .addComponent(btnMostrar)))
                .addContainerGap(71, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cmbAnimal, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtCor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtRaca, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtIdade, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtQuantidade, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblQuantidade))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnFechar)
                    .addComponent(btnMostrar))
                .addContainerGap(26, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cmbAnimalItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cmbAnimalItemStateChanged
        String animal = cmbAnimal.getSelectedItem().toString();
        if (evt.getItem().equals(animal)) {
            lblQuantidade.setEnabled(true);
            txtQuantidade.setEnabled(true);
            switch (cmbAnimal.getSelectedIndex()) {
                case 0:
                    lblQuantidade.setText("Qtd. Corcovas");
                    break;
                case 1:
                    lblQuantidade.setText("Qtd. Cores");
                    break;
                case 2:
                    lblQuantidade.setText("Qtd. Pintas");
                    break;
                case 3:
                    lblQuantidade.setText("Quantidade");
                    lblQuantidade.setEnabled(false);
                    txtQuantidade.setEnabled(false);
                    break;
            }
        }
    }//GEN-LAST:event_cmbAnimalItemStateChanged

    private void btnFecharActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnFecharActionPerformed
        System.exit(0);
    }//GEN-LAST:event_btnFecharActionPerformed

    private void btnMostrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMostrarActionPerformed
        if (txtCor.getText().isEmpty()) {
            formEx1.msg("Faltando a Cor");
            return;
        }
        if (txtRaca.getText().isEmpty()) {
            formEx1.msg("Faltando a Raça");
            return;
        }
        if (txtIdade.getText().isEmpty()) {
            formEx1.msg("Faltando a Idade");
            return;
        }
        if (txtQuantidade.getText().isEmpty() && cmbAnimal.getSelectedIndex() != 3) {
            formEx1.msg("Faltando a Quantidade");
            return;
        }
        switch (cmbAnimal.getSelectedIndex()) {
            case 0:
                Camelo camelo = new Camelo();
                camelo.cor = txtCor.getText();
                camelo.raca = txtRaca.getText();
                camelo.idade = Integer.parseInt(txtIdade.getText());
                camelo.qtdCorcovas = Integer.parseInt(txtQuantidade.getText());
                camelo.Mostrar();
                break;
            case 1:
                Camaleao camaleao = new Camaleao();
                camaleao.cor = txtCor.getText();
                camaleao.raca = txtRaca.getText();
                camaleao.idade = Integer.parseInt(txtIdade.getText());
                camaleao.qtdCores = Integer.parseInt(txtQuantidade.getText());
                camaleao.Mostrar();
                break;
            case 2:
                Onca onca = new Onca();
                onca.cor = txtCor.getText();
                onca.raca = txtRaca.getText();
                onca.idade = Integer.parseInt(txtIdade.getText());
                onca.qtdPintas = Integer.parseInt(txtQuantidade.getText());
                onca.Mostrar();
                break;
            case 3:
                Cachorro cachorro = new Cachorro();
                cachorro.cor = txtCor.getText();
                cachorro.raca = txtRaca.getText();
                cachorro.idade = Integer.parseInt(txtIdade.getText());
                cachorro.Mostrar();
                break;
        }
    }//GEN-LAST:event_btnMostrarActionPerformed

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FrmAnimal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmAnimal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmAnimal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmAnimal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmAnimal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnFechar;
    private javax.swing.JButton btnMostrar;
    private javax.swing.JComboBox<String> cmbAnimal;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel lblQuantidade;
    private javax.swing.JTextField txtCor;
    private javax.swing.JTextField txtIdade;
    private javax.swing.JTextField txtQuantidade;
    private javax.swing.JTextField txtRaca;
    // End of variables declaration//GEN-END:variables
    public class Animal {

        public String cor;
        public String raca;
        public int idade = 0;

        public String GenerateText() {
            String text = "";
            if (!this.cor.isEmpty()) {
                text += "\nCor: " + this.cor;
            }
            if (!this.raca.isEmpty()) {
                text += "\nRaça: " + this.raca;
            }
            text += "\nIdade: " + this.idade;
            return text;
        }
    }

    public class Camelo extends Animal {

        public int qtdCorcovas;

        public void Mostrar() {
            String text = "Animal: Camelo";
            text += this.GenerateText();
            text += "\nQtd. Corcovas: " + this.qtdCorcovas;
            formEx1.msg(text);
        }
    }

    public class Camaleao extends Animal {

        public int qtdCores;

        public void Mostrar() {
            String text = "Animal: Camaleão";
            text += this.GenerateText();
            text += "\nQtd. Cores: " + this.qtdCores;
            formEx1.msg(text);
        }
    }

    public class Onca extends Animal {

        public int qtdPintas;

        public void Mostrar() {
            String text = "Animal: Onça";
            text += this.GenerateText();
            text += "\nQtd. Pintas: " + this.qtdPintas;
            formEx1.msg(text);
        }
    }

    public class Cachorro extends Animal {

        public void Mostrar() {
            String text = "Animal: Cachorro";
            text += this.GenerateText();
            formEx1.msg(text);
        }
    }
}
