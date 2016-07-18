package com.four.myapp.proposal.persistence;

import com.four.myapp.proposal.domain.ProposalVO;

public interface ProposalDao {
	public void temporarySaveProposal(ProposalVO proposalDto);
	public void submitProposal(ProposalVO proposalDto);
	public void updateProposal(ProposalVO proposalDto);
}
