using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountTypeController : ControllerBase
    {
        private readonly IAccountTypeService _service;
        private readonly ILogger<AccountTypeController> _logger;

        public AccountTypeController(IAccountTypeService service, ILogger<AccountTypeController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<AccountTypesDto>>> GetAllAccountType()
        {
            try
            {
                var accountTypes = await _service.GetAllAccountTypeAsync();
                return Ok(accountTypes);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching account Types.");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<AccountTypesDto>> GetAccountTypeById(int id)
        {
            try
            {
                var accountType = await _service.GetAccountTypeAsync(id);
                if (accountType == null)
                {
                    return NotFound();
                }
                return Ok(accountType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching account Type with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPost]
        public async Task<ActionResult<AccountTypesDto>> AddAccountType(AccountTypesDto accountTypeDto)
        {
            try
            {
                var createdAccountType = await _service.CreateAccountTypeAsync(accountTypeDto);
                return CreatedAtAction(nameof(GetAccountTypeById), new { id = createdAccountType.Id }, createdAccountType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding account Type.");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<AccountTypesDto>> UpdateAccountType(int id, AccountTypesDto accountTypeDto)
        {
            try
            {
                var updatedAccountType = await _service.UpdateAccountTypeAsync(id, accountTypeDto);
                return Ok(updatedAccountType);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating account Type with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAccountType(int id)
        {
            try
            {
                await _service.DeleteAccountTypeAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting account type with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
