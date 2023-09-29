
package exOO.ex4;

import exOO.formEx1;

public class FormEx4 extends javax.swing.JFrame {

    public FormEx4() {
        initComponents();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        txtValor1 = new javax.swing.JTextField();
        txtValor2 = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        btnMaiorNoParam = new javax.swing.JButton();
        btnMaiorNoParam1 = new javax.swing.JButton();
        btnMaiorNoParam2 = new javax.swing.JButton();
        btnMaiorNoParam3 = new javax.swing.JButton();
        btnMaiorNoParam4 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Valor 2");

        jLabel2.setText("Valor 1");

        btnMaiorNoParam.setText("Mostrar maior sem parâmetros");
        btnMaiorNoParam.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMaiorNoParamActionPerformed(evt);
            }
        });

        btnMaiorNoParam1.setText("Mostrar maior com parâmetros");
        btnMaiorNoParam1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMaiorNoParam1ActionPerformed(evt);
            }
        });

        btnMaiorNoParam2.setText("Mostrar menor sem parâmetros");
        btnMaiorNoParam2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMaiorNoParam2ActionPerformed(evt);
            }
        });

        btnMaiorNoParam3.setText("Mostrar menor com parâmetros");
        btnMaiorNoParam3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMaiorNoParam3ActionPerformed(evt);
            }
        });

        btnMaiorNoParam4.setText("Verificar se a soma dos valores é primo");
        btnMaiorNoParam4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMaiorNoParam4ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(53, 53, 53)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jLabel2)
                            .addComponent(txtValor2, javax.swing.GroupLayout.PREFERRED_SIZE, 282, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtValor1, javax.swing.GroupLayout.PREFERRED_SIZE, 282, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnMaiorNoParam)
                            .addComponent(btnMaiorNoParam1))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnMaiorNoParam2)
                            .addComponent(btnMaiorNoParam3))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(btnMaiorNoParam4)
                .addGap(83, 83, 83))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtValor1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtValor2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnMaiorNoParam)
                    .addComponent(btnMaiorNoParam2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnMaiorNoParam1)
                    .addComponent(btnMaiorNoParam3))
                .addGap(18, 18, 18)
                .addComponent(btnMaiorNoParam4)
                .addContainerGap(14, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private boolean verificaValores() {
        if (txtValor1.getText().isEmpty()
                || !formEx1.isInteger(txtValor1.getText())
                || txtValor2.getText().isEmpty()
                || !formEx1.isInteger(txtValor2.getText())) {
            formEx1.msg("Digite valores válidos inteiros");
            return false;
        }
        return true;
    }
    private Teste factoryTeste(){
        Teste values = new Teste();
        values.valor1 = Integer.parseInt(txtValor1.getText());
        values.valor2 = Integer.parseInt(txtValor2.getText());
        return values;
    }

    private void btnMaiorNoParamActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMaiorNoParamActionPerformed
        if (!verificaValores()) {
            return;
        }
        Teste teste = factoryTeste();
        teste.verificaMaior();
        formEx1.msg("O valor maior é "+ teste.verificacao);
    }//GEN-LAST:event_btnMaiorNoParamActionPerformed

    private void btnMaiorNoParam1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMaiorNoParam1ActionPerformed
        if (!verificaValores()) {
            return;
        }
        Teste teste = factoryTeste();
        formEx1.msg("O valor maior é "+ teste.verificaMaior(teste.valor1,teste.valor2));
    }//GEN-LAST:event_btnMaiorNoParam1ActionPerformed

    private void btnMaiorNoParam2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMaiorNoParam2ActionPerformed
        if (!verificaValores()) {
            return;
        }
        Teste teste = factoryTeste();
        teste.verificaMenor();
        formEx1.msg("O valor menor é "+ teste.verificacao);
    }//GEN-LAST:event_btnMaiorNoParam2ActionPerformed

    private void btnMaiorNoParam3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMaiorNoParam3ActionPerformed
        if (!verificaValores()) {
            return;
        }
        Teste teste = factoryTeste();
        formEx1.msg("O valor menor é "+ teste.verificaMenor(teste.valor1,teste.valor2));
    }//GEN-LAST:event_btnMaiorNoParam3ActionPerformed

    private void btnMaiorNoParam4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMaiorNoParam4ActionPerformed
        if (!verificaValores()) {
            return;
        }
        Teste teste = factoryTeste();
        int soma = teste.valor1 + teste.valor2;
        formEx1.msg("A soma dos valores é " + soma + " e esse número " + teste.verificaPrimo(soma));
    }//GEN-LAST:event_btnMaiorNoParam4ActionPerformed

    /**
     * @param args the command line arguments
     */
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
            java.util.logging.Logger.getLogger(FormEx4.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FormEx4.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FormEx4.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FormEx4.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FormEx4().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnMaiorNoParam;
    private javax.swing.JButton btnMaiorNoParam1;
    private javax.swing.JButton btnMaiorNoParam2;
    private javax.swing.JButton btnMaiorNoParam3;
    private javax.swing.JButton btnMaiorNoParam4;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JTextField txtValor1;
    private javax.swing.JTextField txtValor2;
    // End of variables declaration//GEN-END:variables
}
