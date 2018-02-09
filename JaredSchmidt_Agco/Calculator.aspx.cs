using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JaredSchmidt_Agco
{
    // Testing Strategy:
    // Verify all buttons are working as expected and no error are thrown.
    // Compare the results for all operator buttons with expected results.
    // This calculator functionality is based on the Windows calculator app so I compared my results to results from the calculator app.
    // I ran the project in debug mode and stepped through the calculation method to ensure everything is working as intended. 
    // Reviewed code for any inefficiencies, redundancy or formatting issues.
    // Reviewed the user interface for any styling issues as well as to ensure an intuitive user experience.

    public partial class Calculator : System.Web.UI.Page
    {
    
    #region Events

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                this.hiddenFieldValue.Value = "0";
                this.hiddenFieldSign.Value = string.Empty;
            }
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {

            //Get the operator attribute from the button.
            Button btn = (Button)sender;
            string sign = btn.Attributes["Value"].ToString();
            
            // If this is the first value entered then set the initial value and the sign.
            if (this.hiddenFieldSign.Value == string.Empty)
            {
                this.hiddenFieldSign.Value = sign;
                this.hiddenFieldValue.Value = this.txtTotal.Text;
            }
            // If this is not the first value entered then do the calculation, set and display the new value and set the operator for the next calculation.
            else
            {
                double total = Convert.ToDouble(this.hiddenFieldValue.Value);
                double value = Convert.ToDouble(this.txtTotal.Text);

                switch (this.hiddenFieldSign.Value)
                {
                    case "Plus":
                        total += value;
                        break;
                    case "Minus":
                        total -= value;
                        break;
                    case "Multiply":
                        total *= value;
                        break;
                    case "Divide":
                        total /= value;
                        break;
                }

                total = Math.Round(total, 4);
                this.hiddenFieldValue.Value = total.ToString();
                this.hiddenFieldSign.Value = sign;
                this.txtTotal.Text = total.ToString();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            //Reset the operator and the values.
            this.hiddenFieldSign.Value = string.Empty;
            this.hiddenFieldValue.Value = this.txtTotal.Text = "0";
        }

    #endregion

    }
}