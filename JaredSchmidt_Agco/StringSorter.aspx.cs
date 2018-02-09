using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace JaredSchmidt_Agco
{
    // Testing Strategy:
    // Entered text in the text box and verified all buttons are working as expected and no error are thrown.
    // Reviewed the results in the listbox to make sure items were sorted correctly.
    // Tested sending emails to make sure they send correctly and that the content is correct.
    // Implemented try/catch block and then forced errors to ensure errors are being handled and displayed correctly.
    // Tested the client side validation on the email field.
    // Reviewed code for any inefficiencies, redundancy or formatting issues.
    // Reviewed the user interface for any styling issues as well as to ensure an intuitive user experience.

    public partial class StringSorter : System.Web.UI.Page
    {

    #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblMessage.Visible = false;
        }

        protected void btnSort_Click(object sender, EventArgs e)
        {
            //Clear the listbox each time the sort button is clicked.
            this.listBoxStrings.Items.Clear();

            //Save the string and split it based on the selected delimiters then use the system array sort method to sort the strings alphabetically.
            String value = this.txtParagraph.Text;
            Char[] delimiter = { ' ', '.', ',', ':', ';'};
            String[] substrings = value.Split(delimiter, StringSplitOptions.RemoveEmptyEntries);
            Array.Sort(substrings);

            //Add each of the substrings to the listbox.
            foreach (var substring in substrings)
                this.listBoxStrings.Items.Add(new ListItem(substring));
        }

        protected void btnEmailList_Click(object sender, EventArgs e)
        {

            //If there are items in the list then generate a string to insert in the body of the email.
            string listItems = "List is empty.";

            if (this.listBoxStrings.Items.Count != 0)
            {
                listItems = "List of Substrings:<br />";

                foreach (ListItem item in this.listBoxStrings.Items)
                {
                    listItems += item.Text + "<br />";
                }
            }

            //Create a new message and set up the smtp client.
            //The password for the email account used is Agco1234.
            MailMessage msg = new MailMessage();

            msg.From = new MailAddress("jaredschmidtagco@gmail.com");
            msg.To.Add(new MailAddress(this.txtEmail.Text));
            msg.Subject = "List of Substrings";
            msg.IsBodyHtml = true;
            msg.Body = listItems;
            SmtpClient client = new SmtpClient();
            client.UseDefaultCredentials = true;
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new System.Net.NetworkCredential("jaredschmidtagco@gmail.com", this.txtPassword.Text);
            client.Timeout = 20000;

            //Use a try catch block to catch any errors when sending the email and display a message indicating success or failure.
            try
            {
                client.Send(msg);
                this.lblMessage.Visible = true;
                this.lblMessage.Text = "Email was sent successfully!";
                this.lblMessage.CssClass = "text-success input";

            }
            catch (Exception ex)
            {
                this.lblMessage.Visible = true;
                this.lblMessage.Text = "There was an error sending your email. Please try again later.<br>The following error occured:<br>" + ex;
                this.lblMessage.CssClass = "text-danger input";
            }
            finally
            {
                msg.Dispose();
            }
        }

    #endregion

    }
}