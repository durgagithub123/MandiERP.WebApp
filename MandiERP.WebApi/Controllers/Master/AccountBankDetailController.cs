using MandiERP.Abstractions.Master;
using MandiERP.Abstractions.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MandiERP.WebApi.Controllers.Master
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountBankDetailController : ControllerBase
    {
        private readonly IAccountBankDetailService _service;
        private readonly ILogger<AccountBankDetailController> _logger;

        public AccountBankDetailController(IAccountBankDetailService service, ILogger<AccountBankDetailController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<AccountBankDetailDto>>> GetAllAccountsBankDetail()
        {
            try
            {
                var accountBankDetails = await _service.GetAllAccountsBankDetailAsync();
                return Ok(accountBankDetails);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching accountBankDetails.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<AccountBankDetailDto>> GetAccountBankDetailById(long id)
        {
            try
            {
                var accountBankDetail = await _service.GetAccountBankDetailAsync(id);
                if (accountBankDetail == null)
                {
                    return NotFound();
                }
                return Ok(accountBankDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while fetching accountBankDetail with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPost]
        public async Task<ActionResult<AccountBankDetailDto>> AddAccountBankDetail(AccountBankDetailDto accountBankDetailDto)
        {
            try
            {
                var createdAccountBankDetail = await _service.CreateAccountBankDetailAsync(accountBankDetailDto);
                return CreatedAtAction(nameof(GetAccountBankDetailById), new { id = createdAccountBankDetail.Id }, createdAccountBankDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding accountBankDetail.");
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpPut("{id}")]
        public async Task<ActionResult<AccountBankDetailDto>> UpdateAccountBankDetail(long id, AccountBankDetailDto accountBankDetailDto)
        {
            try
            {
                var updatedAccountBankDetail = await _service.UpdateAccountBankDetailAsync(id, accountBankDetailDto);
                return Ok(updatedAccountBankDetail);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating accountBankDetail with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAccountBankDetail(int id)
        {
            try
            {
                await _service.DeleteAccountBankDetailAsync(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while deleting accountBankDetail with id {Id}.", id);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
