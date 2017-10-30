using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{

    public partial class Gallery : System.Web.UI.Page
    {

        public void DisplayUploadedPhotos(string folder)
        {
            string[] allPhotoFiles = System.IO.Directory.GetFiles(folder);
            List<String> imagesList = new List<String>();

            foreach (string photoFile in allPhotoFiles)
            {
                imagesList.Add("~/Photos/" + User.Identity.Name + "/" + System.IO.Path.GetFileName(photoFile));
            }

            RepeaterUserPhoto.DataSource = imagesList;
            RepeaterUserPhoto.DataBind();

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            if(FileUpload.HasFile)
            {
                if((FileUpload.PostedFile.ContentType == "image/jpeg") ||
                  (FileUpload.PostedFile.ContentType == "image/png") ||
                  (FileUpload.PostedFile.ContentType == "image/bmp"))
                {
                    if(Convert.ToInt64(FileUpload.PostedFile.ContentLength) < 10000000)
                    {
                        string photoFolder = System.IO.Path.Combine(Server.MapPath("~/Photos/"), User.Identity.Name);

                        if (!System.IO.Directory.Exists(photoFolder))
                        {
                            System.IO.Directory.CreateDirectory(photoFolder);
                        }

                        string newPath = System.IO.Path.Combine(photoFolder, System.IO.Path.GetFileNameWithoutExtension(FileUpload.FileName) + DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload.FileName));
                        FileUpload.SaveAs(newPath);

                        LblStatus.Text = "<font color='green'> Successfullyuploaded file " + FileUpload.FileName + " </ font > ";
                        DisplayUploadedPhotos(photoFolder);
                    }
                    else
                    {
                        LblStatus.Text = "Selected file is too big!";
                    }
                }
                else
                {
                    LblStatus.Text = "Selected file is not bmp/jpeg/png file! You shouldn't use gallery.";
                }
            }
            else
            {
                LblStatus.Text = "No file has been selected :(";
            }
        }
    }
}