﻿using System.ComponentModel.DataAnnotations;

namespace WebBanHang.ViewModel
{
    public class UploadOneFile
    {
        [Required(ErrorMessage = "Phải chọn file upload")]
        [DataType(DataType.Upload)]
        [FileExtensions(Extensions = "png,jpg,jpeg,gif")]
        [Display(Name = "Chọn file upload")]
        public IFormFile ?FileUpload { get; set; }
    }
}
