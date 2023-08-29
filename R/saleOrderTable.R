#' 查看即时库存更新报表
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' saleOrderTable()
saleOrderTable <- function(input,output,session,dms_token) {
  var_FStartDate=tsui::var_date('FStartDate')
  var_FEndDate=tsui::var_date('FEndDate')
  var_FIsFree=tsui::var_ListChoose1('FIsFree')
  var_FBIllType = tsui::var_text('FBIllType')
  var_Fstatus = tsui::var_ListChooseN('Fstatus')
  var_FOrgNumber = tsui::var_ListChooseN('FOrgNumber')
  
  shiny::observeEvent(input$dl_saleOrderTable_query,{
    token <- dms_token
    FStartDate <- var_FStartDate()
    FEndDate <- var_FEndDate()
    FIsFree <-var_FIsFree()
    FBIllType <-var_FBIllType()
    Fstatus <-var_Fstatus()
    FOrgNumber <-var_FOrgNumber()
    
    data <- mdlKrSaleStatRptr::saleOrderTable_query(token = token,FStartDate = FStartDate,FEndDate = FEndDate,FIsFree = FIsFree,
                                                    Fstatus =Fstatus 
                                                  ,FBIllType =FBIllType ,FOrgNumber = FOrgNumber)
    
    
    tsui::run_dataTable2(id = 'dt_saleOrderTable_query_dataView',data = data)
    
  })
  
  
  
  
}
