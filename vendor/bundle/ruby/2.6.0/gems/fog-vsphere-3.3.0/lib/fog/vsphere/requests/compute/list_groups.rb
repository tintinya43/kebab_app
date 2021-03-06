module Fog
  module Vsphere
    class Compute
      class Real
        def list_groups(filters = {})
          cluster = get_raw_cluster(filters[:cluster], filters[:datacenter])
          cluster.configurationEx.group.map { |g| group_attributes g, filters }
        end

        protected

        def group_attributes(group, filters)
          attributes = {}
          attributes[:datacenter] = filters[:datacenter]
          attributes[:cluster] = filters[:cluster]
          attributes[:name] = group[:name]
          attributes[:type] = group.class
          if group.class.to_s == 'ClusterVmGroup' then attributes[:vm_ids] = group[:vm].map { |vm| vm.config.instanceUuid } end
          if group.class.to_s == 'ClusterHostGroup' then attributes[:hosts] = group[:host].map(&:name) end
          attributes
        end
      end
      class Mock
        def list_groups(filters = {})
          data[:groups].values.select { |g| g[:datacenter] == filters[:datacenter] && g[:cluster] == filters[:cluster] }
        end
      end
    end
  end
end
