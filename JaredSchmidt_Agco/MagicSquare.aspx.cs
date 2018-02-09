using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace JaredSchmidt_Agco
{
    // Testing Strategy:
    // Verified the button and dropdown list was working as expected and that no errors were thrown.
    // Compared the results received for each square to the know correct answer.
    // Reviewed code for any inefficiencies, redundancy or formatting issues.
    // Reviewed the user interface for any styling issues as well as to ensure an intuitive user experience.

    public partial class MagicSquare : System.Web.UI.Page
    {

    #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Load the dropdown list with the required values.
                this.ddlSize.Items.Add(new ListItem("3rd", "3"));
                this.ddlSize.Items.Add(new ListItem("5th", "5"));
                this.ddlSize.Items.Add(new ListItem("9th", "9"));
            }
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            //Set the grid size based on the selection.
            int size = Convert.ToInt32(this.ddlSize.SelectedValue);
            int half = size / 2;

            //Set the grid template
            if (size == 3) this.divGrid.Attributes.Add("class", "grid grid-three");
            else if (size == 5) this.divGrid.Attributes.Add("class", "grid grid-five");
            else if (size == 9) this.divGrid.Attributes.Add("class", "grid grid-nine");

            //Loop through the rows and columns and create a cell in the grid for each value.
            for (int col = 1; col < size + 1; col++)
            {
                for (int row = 1; row < size + 1; row++)
                {
                    HtmlGenericControl div = new HtmlGenericControl("div");

                    //Calculated the cell value based on the formula from the Magic Square Wikipedia page
                    div.InnerHtml = (size * ((col + row - 1 + half) % size) + ((col + 2 * row - 2) % size) + 1).ToString();
                    this.divGrid.Controls.Add(div);
                }
            }
        }

    #endregion

    }
}