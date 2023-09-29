package exOO.ex8;

import exOO.formEx1;
import java.text.DecimalFormat; 

public class FrmDeposito extends javax.swing.JFrame {

    public FrmDeposito() {
        initComponents();
    }
    
    private DecimalFormat df = new DecimalFormat("#,###.00");

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        txtValor = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txtMeses = new javax.swing.JTextField();
        btnPoupanca = new javax.swing.JButton();
        btnFundo = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Capital");

        jLabel2.setText("Meses aplicação");

        btnPoupanca.setText("Poupança");
        btnPoupanca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnPoupancaActionPerformed(evt);
            }
        });

        btnFundo.setText("Fundos");
        btnFundo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnFundoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(89, 89, 89)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btnPoupanca)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnFundo))
                    .addGroup(javax.swing.GroupLayout.Alignment.CENTER, layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txtValor, javax.swing.GroupLayout.PREFERRED_SIZE, 159, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(javax.swing.GroupLayout.Alignment.CENTER, layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtMeses, javax.swing.GroupLayout.PREFERRED_SIZE, 113, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(120, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(56, 56, 56)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtValor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtMeses, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnPoupanca)
                    .addComponent(btnFundo))
                .addContainerGap(56, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnPoupancaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPoupancaActionPerformed
        if(txtValor.getText().isEmpty()){
            formEx1.msg("Faltando valor de Capital");
            return;
        }
        if(txtMeses.getText().isEmpty()){
            formEx1.msg("Faltando meses");
            return;
        }
        int valor = Integer.parseInt(txtValor.getText());        
        int meses = Integer.parseInt(txtMeses.getText());

        Poupanca poupanca = new Poupanca();
        poupanca.calcular(valor, meses);
    }//GEN-LAST:event_btnPoupancaActionPerformed

    private void btnFundoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnFundoActionPerformed
        if(txtValor.getText().isEmpty()){
            formEx1.msg("Faltando valor de Capital");
            return;
        }
        if(txtMeses.getText().isEmpty()){
            formEx1.msg("Faltando meses");
            return;
        }
        int valor = Integer.parseInt(txtValor.getText());        
        int meses = Integer.parseInt(txtMeses.getText());

        Fundo fundo = new Fundo();
        fundo.calcular(valor, meses);
    }//GEN-LAST:event_btnFundoActionPerformed

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
            java.util.logging.Logger.getLogger(FrmDeposito.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmDeposito.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmDeposito.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmDeposito.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmDeposito().setVisible(true);
            }
        });
    }

    private class Deposito {

        public void calcular(int valor, int meses) {

        }
    }

    private class Poupanca extends Deposito {

        @Override
        public void calcular(int valor, int meses) {
            double calculo = valor * Math.pow((1 + 0.007), meses);
            formEx1.msg("O montante gerado na Poupança pelo capital de R$" + valor + " em 6 meses é de R$" + df.format(calculo));
        }
    }

    private class Fundo extends Deposito {

        @Override
        public void calcular(int valor, int meses) {
            double calculo = valor * Math.pow((1 + 0.0075), meses);
            formEx1.msg("O montante gerado no Fundo pelo capital de R$" + valor + " em 6 meses é de R$" + df.format(calculo));
        }
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnFundo;
    private javax.swing.JButton btnPoupanca;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JTextField txtMeses;
    private javax.swing.JTextField txtValor;
    // End of variables declaration//GEN-END:variables
}
