class IAgencyRepository{

	// fetch all agencies without their subobjects
    async getAllAgencies(){};

    // create a new agency
    async createAgency(agency){};

    // fetch agency by its id with all its subobjects
    async getAgencyByIdWithAllItsSubObjects(id){};

    // fetch agency by its id without its subobjects
    async getAgencyByIdWithoutItsSubObjects(id){};

    // make modification to the agency document
    async updateAgency(agencyId, modification){};
    
}

module.exports = IAgencyRepository;