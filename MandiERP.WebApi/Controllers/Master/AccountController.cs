using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service;
using MandiERP.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IAccountService _service;
        private readonly ILogger<AccountController> _logger;

        public AccountController(IAccountService service, ILogger<AccountController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<AccountDto>>> GetAllAccounts()
        {
            try
            {
                var accounts = await _service.GetAllAccountsAsync();
                return Ok(accounts);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching accounts.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<AccountDto>> GetAccountById(int id)
        {
            try
            {
                var account = await _service.GetAccountAsync(id);
                if (account == null)
                {
                    return NotFound();
                }
                return Ok(account);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching account with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPost]
        public async Task<ActionResult<AccountDto>> AddAccount(AccountDto accountDto)
        {
            try
            {
                var createdAccount = await _service.CreateAccountAsync(accountDto);
                return CreatedAtAction(nameof(GetAccountById), new { id = createdAccount.Id }, createdAccount);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding account.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPut("{id}")]
        public async Task<ActionResult<AccountDto>> UpdateAccount(int id, AccountDto accountDto)
        {
            try
            {
                var updatedAccount = await _service.UpdateAccountAsync(id, accountDto);
                return Ok(updatedAccount);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating account with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAccount(int id)
        {
            try
            {
                await _service.DeleteAccountAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting account with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
