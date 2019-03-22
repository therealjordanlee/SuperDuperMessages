using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using SuperDuperMessages.Configurations;

namespace SuperDuperMessages.Controllers
{
    [Route("/")]
    public class MessageController : Controller
    {
        private SuperDuperMessagesConfiguration _superDuperMessagesConfiguration;
        
        public MessageController(IOptions<SuperDuperMessagesConfiguration> messageConfiguration)
        {
            _superDuperMessagesConfiguration = messageConfiguration.Value;
        }

        [HttpGet("/hello")]
        public IActionResult GetHello()
        {
            return Ok(_superDuperMessagesConfiguration.HelloMessage);
        }

        [HttpGet("/goodbye")]
        public IActionResult GetGoodbye()
        {
            return Ok(_superDuperMessagesConfiguration.GoodbyeMessage);
        }
    }
}