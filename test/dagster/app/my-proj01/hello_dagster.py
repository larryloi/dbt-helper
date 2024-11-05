from dagster import asset, AssetExecutionContext, AssetIn, FreshnessPolicy
from dagster_docker import docker_executor

@asset
def my_asset():
    return [1,2,3]