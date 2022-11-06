provider "azurerm" {
    features {}
    subscription_id = var.SUBSCRIPTION
    tenant_id = var.TENANT
    client_id = var.CLIENT_ID
    client_secret = var.CLIENT_SECRET
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.log-resource-group
  location = var.region
}

resource "azurerm_log_analytics_workspace" "logworkspace" {
  name                = "log-ws"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_data_collection_rule" "datarule" {
  name                = "linux-data-collection-rule"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  kind = "Linux"

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.logworkspace.id
      name                  = "destination-log"
    }
  }

  data_flow {
    streams      = ["Microsoft-InsightsMetrics", "Microsoft-Syslog", "Microsoft-Perf"]
    destinations = ["destination-log"]
  }

  data_sources {
    syslog {
      facility_names = ["*"]
      log_levels     = ["*"]
      name           = "datasource-syslog"
    }

    performance_counter {
      streams                       = ["Microsoft-Perf", "Microsoft-InsightsMetrics"]
      sampling_frequency_in_seconds = 10
      counter_specifiers            = ["*"]
      name                          = "datasource-perfcounter"
      
    }

  }

  description = "data collection rule for linux"

}
